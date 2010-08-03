

class PremierMain
  def self.start nav
    modules_actif = RhizomeModule.actifs
    @vue = Fen_lanceur.new nav, modules_actif
    @vue.visible! true
  end
end

