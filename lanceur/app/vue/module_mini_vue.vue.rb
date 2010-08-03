class Module_mini_vue < Module_launcher
  def initialize nav, arg
    super()
    @navigation = nav
    jrhizette.set_text(arg.titre)
    jblabla.set_text(arg.description)
    btn_lance.add_action_listener {|evt| @navigation.launch_module(arg.action)}
  end
end
