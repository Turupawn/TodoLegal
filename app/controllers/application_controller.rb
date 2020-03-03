class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def authenticate_admin!
    if !current_user
      redirect_to "/?error=No+session"
      return
    end
  end

  def user_can_manage_permissions!
    if !current_user
      redirect_to "/?error=No+session"
      return
    end
    if !current_user.permissions.find_by_name("manejar permisos")
      redirect_to "/?error=Invalid+permissions"
    end
  end

  def user_can_see_subscriptions!
    if !current_user
      redirect_to "/?error=No+session"
      return
    end
    if !current_user.permissions.find_by_name("ver suscripciones")
      redirect_to "/?error=Invalid+permissions"
    end
  end

protected
  def after_sign_up_path_for(resource)
    root_path
  end
  def after_sign_in_path_for(resource)
    root_path
  end

  def findLaws query
    @laws = Law.all.search_by_name(query).with_pg_search_highlight
  end

  def findArticles query
    Article.search_by_body_trimmed(query).with_pg_search_highlight.group_by(&:law_id)
  end
end
