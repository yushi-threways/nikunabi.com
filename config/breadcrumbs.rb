crumb :root do
  link "ニクナビ", root_path
end

crumb :agreement do
  link "ニクナビ店舗会員規約及び個人情報の取り扱いについて", documents_agreement_path
end

crumb :recommend do |recommend|
  link "こだわり部位#{ recommend.name }の店舗", recommend_path(recommend)
  parent :root
end

crumb :area do |area|
  link "#{ area.name }エリア店舗", area_path(area)
  parent :root
end

crumb :feature do |feature|
  link "#{ faeture.name }がある店舗", feature_path(feature)
  parent :root
end

crumb :area_shop do |shop|
  link shop.name, area_shop_path(:area_areacode => shop.area.areacode, :id => shop)
  parent :area, area
end

crumb :show_blog do |blog|
  link blog.title, blog_path(blog)
  parent :root
end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
