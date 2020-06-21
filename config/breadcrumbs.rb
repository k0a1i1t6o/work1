crumb :root do
  link "Motif", home_path
end

crumb :user do |user|
  if current_user?(user)
    link "マイページ", user_path(user)
  else
    link user.name, user_path(user)
  end
end

crumb :edit_user do |user|
  link "プロフィール", edit_user_path(user)
  parent :user, user
end

crumb :goalpost do |goalpost|
  if current_user?(goalpost.user)
    link "投稿した目標", goalpost_path(goalpost)
    parent :user, goalpost.user
  else
    link goalpost.goal, goalpost_path(goalpost)
  end
end

crumb :edit_goalpost do |goalpost|
  link "目標の編集", edit_goalpost_path(goalpost)
  parent :goalpost, goalpost
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).