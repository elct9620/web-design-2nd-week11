(function() {
  var body, footer, footer_menu, handle_click, handle_portfolio, header, hide_full_work, last_image, last_work, load_works_image, menu, pages, portfolio, works, works_image_buffer, wrapper;

  body = $("body");

  menu = $("#menu");

  footer_menu = $("#mini-menu");

  header = $("#header");

  footer = $("#footer");

  wrapper = $("#wrapper");

  portfolio = $("#portfolio");

  works = portfolio.find("article");

  pages = wrapper.find("section");

  last_work = null;

  last_image = $("#portfolio").find("#work-view");

  works_image_buffer = {};

  $(document).ready(function() {
    menu.on("click", "a", handle_click);
    footer_menu.on("click", "a", handle_click);
    portfolio.on("click", "a.full-screen", handle_portfolio);
    last_image.on("click", hide_full_work);
    return load_works_image();
  });

  handle_click = function(e) {
    var page, target, trigger;
    trigger = $(e.currentTarget);
    page = trigger.data("page");
    target = $(page);
    menu.find("a").removeClass("active");
    footer_menu.find("a").removeClass("active");
    pages.addClass("hide");
    if (page === "#about") {
      header.removeClass("hide");
      body.removeClass("mini-menu");
      wrapper.removeClass("small-header");
      footer.addClass("hide");
    } else {
      header.addClass("hide");
      body.addClass("mini-menu");
      wrapper.addClass("small-header");
      footer.removeClass("hide");
    }
    trigger.addClass("active");
    target.removeClass("hide");
    $("a[data-page=" + page + "]").addClass("active");
    if (last_work) {
      last_work.addClass("hide");
      last_work = null;
    }
    last_image.addClass("hide");
    return e.preventDefault();
  };

  handle_portfolio = function(e) {
    var image, source_image, trigger;
    trigger = $(e.currentTarget);
    source_image = trigger.attr("href");
    image = works_image_buffer[source_image];
    if (last_work) {
      last_work.addClass("hide");
    }
    last_image.html(image);
    last_image.removeClass("hide");
    image.css("margin-top", -(image.height() / 2 + 50) + "px");
    last_work = trigger.parents("article").children("header");
    last_work.removeClass("hide");
    return e.preventDefault();
  };

  load_works_image = function() {
    works = works.find("a.full-screen");
    return works.each(function(k, e) {
      var element, link;
      link = $(e).attr("href");
      element = $("<img>").attr("src", link).addClass("full-screen");
      return works_image_buffer[link] = element;
    });
  };

  hide_full_work = function(e) {
    last_image.addClass("hide");
    return last_work.addClass("hide");
  };

}).call(this);
