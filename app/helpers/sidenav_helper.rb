module SidenavHelper
  def active_option?(current_controller)
    'sidenav_active' if current_controller.include?(controller_name)
  end
end
