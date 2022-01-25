module ApplicationHelper
  # render something if a certain condition applies
  def render_if(condition, record)
    render record if condition
  end

  # just render some given template which could be dynamically adjusted,
  # if the actual template does exist
  def render_if_exists(path_to_partial)
    render path_to_partial if lookup_context.find_all(path_to_partial, [], true).any?
  end
end
