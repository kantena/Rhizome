class RhizomeModule < ActiveRecord::Base

  def self.bdd_connection site
    param = {}
    param[:local]={:adapter =>          'jdbc',
                  :driver =>           'org.h2.Driver',
                  :url =>              'jdbc:h2:rhizome_local/base/lanceur.db',
                  :username =>         'jluc',
                  :password =>         'jla'}

    param[:distant]={:adapter =>      'mysql',
                    :host =>         'localhost',
                    :username =>     'root',
                    :password =>     'kantena',
                    :database =>     'rhizome'}
    param = param[site]


    if site == :local
      param[:url] = 'jdbc:h2:' << File.join($HOME, 'base', 'lanceur.db' ) << ";create=true"
    end
    RhizomeModule.establish_connection(param)
  end
  RhizomeModule.bdd_connection :local
  include ObservableClasse

  named_scope :actifs, :conditions => {:actif, true}
  named_scope :presents

  def self.distant *arg
    begin
      RhizomeModule.bdd_connection :distant
      retour = RhizomeModule.send(*arg)
    rescue
      puts "connection distante non effective"
    end

    RhizomeModule.bdd_connection :local

    retour
  end

  def distant *arg
    begin
      RhizomeModule.bdd_connection :distant
      retour = self.send(*arg)
    rescue
      puts "connection distante non effective"
    end
    RhizomeModule.bdd_connection :local
    retour
  end

  def to_hash
    ptihash = attributes
    ptihash.delete 'id'
    ptihash.delete 'install'
    ptihash.delete 'actif'
    ptihash
  end

  def self.disponibles
    locals = RhizomeModule.presents
    distants = RhizomeModule.distant(:find, :all)
    retour = []
    unless distants.nil?
    distants.each do |elt_dist|
      unless locals.map {|elt_loc| elt_loc.to_hash}.include?(elt_dist.to_hash)
        retour << RhizomeModule.create(elt_dist.to_hash)
      end
    end
  end
  retour + locals
  end

  def after_save
    obs_change true
    notif_tous self
    p attributes
  end




  def change_install
    if self.install
      self.install= false
      self.actif= false
      self.save
      self.destroy
      Module_dispo_controleur.update


    else
      tmp = RhizomeModule.create(self.to_hash)
      tmp.cpy_obs self
      tmp.install= true
      tmp.actif= false
      tmp.save
      #tmp.installation_locale
    end


  end

  def change_actif valeur = !self.actif
    self.actif= valeur
    self.save
    obs_change true
    notif_tous self

  end

  def installation_locale
    require 'net/http'
    http = Net::HTTP.new('www.chez-andrei.fr')
    Dir.mkdir($HOME, 'modules', self.jar[0..-5])
    rhiz_fic = File.join($HOME, 'modules', self.jar[0..-5], self.jar)
    fichier = File.new rhiz_fic, 'w'
    fichier.write http.get('java/' << jar).read_body
    fichier.close
    http.finish
    require rhiz_fic
    File.syscopy File.join(self.jar[0..-5], 'lib', 'base.db'), File.join($HOME, 'base', self.jar[0..-5] << '.db')






  end

end

