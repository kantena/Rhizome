class Module_mini_vue < Module_launcher
  def initialize arg
    super()
    jrhizette.set_text(arg.titre)
    jblabla.set_text(arg.description)
    btn_lance.add_action_listener {|evt| NavigationController.navigation.launch_module(arg.action)}
  end
end
