
body = $("body")
menu = $("#menu")
footer_menu = $("#mini-menu")
header = $("#header")
footer = $("#footer")
wrapper = $("#wrapper")
portfolio = $("#portfolio")
works = portfolio.find("article")
pages = wrapper.find("section")
last_work = null
last_image = $("#portfolio").find("#work-view")

works_image_buffer = {}

$(document).ready ->
  menu.on("click", "a", handle_click)
  footer_menu.on("click", "a", handle_click)
  portfolio.on("click", "a.full-screen", handle_portfolio)
  last_image.on("click", hide_full_work)
  load_works_image()

handle_click = (e) ->
  trigger = $(e.currentTarget)
  page = trigger.data("page")
  target = $(page)

  menu.find("a").removeClass("active")
  footer_menu.find("a").removeClass("active")
  pages.addClass("hide")

  if page is "#about"
    header.removeClass("hide")
    body.removeClass("mini-menu")
    wrapper.removeClass("small-header")
    footer.addClass("hide")
  else
    header.addClass("hide")
    body.addClass("mini-menu")
    wrapper.addClass("small-header")
    footer.removeClass("hide")

  trigger.addClass("active")
  target.removeClass("hide")
  $("a[data-page=#{page}]").addClass("active")

  if last_work
    last_work.addClass("hide")
    last_work = null

  last_image.addClass("hide")

  e.preventDefault()

handle_portfolio = (e) ->
  trigger = $(e.currentTarget)
  source_image = trigger.attr("href")
  image = works_image_buffer[source_image]
  if last_work
    last_work.addClass("hide")

  last_image.html(image)
  last_image.removeClass("hide")

  image.css("margin-top", -(image.height()/2 + 50) + "px")

  last_work = trigger.parents("article").children("header")
  last_work.removeClass("hide")

  e.preventDefault()

load_works_image = ->
  works = works.find("a.full-screen")
  works.each (k, e) ->
    link = $(e).attr("href")
    element = $("<img>").attr("src", link).addClass("full-screen")
    works_image_buffer[link] = element

hide_full_work = (e) ->
  last_image.addClass("hide")
  last_work.addClass("hide")
