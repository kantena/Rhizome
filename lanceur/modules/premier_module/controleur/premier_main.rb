

class PremierMain
  def self.start
    modules_actif = RhizomeModule.actifs
    @vue = Fen_lanceur.new self, modules_actif
    @vue.visible! true
  end
end
