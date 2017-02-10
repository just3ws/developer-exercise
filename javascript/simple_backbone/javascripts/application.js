DATA = null;

const Quotes = new function () {
  const models = {
    Paginator: Backbone.Model.extend({
      defaults: {
        pages: 1,
        filter: '',
        current: 1
      }
    }),
    Quote: Backbone.Model.extend({
      toJSON: function() {
        let attrs = this.attributes;
        attrs.key = this.key();
        return attrs;
      },
      key: function () {
        return ['theme', 'context', 'source', 'quote'].map(attr => {
          return this.get(attr)
            .toLowerCase()
            .replace(/\W/gi, ' ')
            .trim()
            .replace(/\s+/gi, '-')
            .replace(/\-{2,}/gi, '-')
        }).join(':');
      }
    })
  };

  const collections = {
    Quotes: Backbone.Collection.extend({
      model: models.Quote,
      initialize: () => console.log('collections.Quotes/initialize'),
      page : function({ number = Page.number(), limit = Page.limit } = {}) {
        console.log('collections.Quotes/page')

        if (number >= Page.pages()) {
          number = Page.pages();
        }

        number = number - 1;

        return _(this.rest(limit * number)).first(limit);
      }
    })
  };

  const views = {
    Paginator: Backbone.View.extend({
      el: 'nav.quotes',
      template: _.template($("#quote-paginator-template").html()),
      model: models.Paginator,
      render: function () {
        console.log('views.Paginator/render');
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    }),
    Quote: Backbone.View.extend({
      template: _.template($('#quote-template').html()),
      model: models.Quote,
      render: function () {
        console.log('views.Quote/render');
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    }),
    Quotes: Backbone.View.extend({
      el: 'section.quotes',
      template: _.template($('#quotes-template').html()),
      initialize: () => console.log('views.Quotes/initialize'),
      render: function () {
        console.log('views.Quotes/render');

        this.$el.html(
          this.template({
            collection: this.collection.map(quote => {
              return (new views.Quote({
                model: quote
              })).render().$el.html();
            })
          })
        );

        return this;
      }
    })
  };

  const routers = {
    Quotes: Backbone.Router.extend({
      routes: {
        '': 'index',
        'movies': 'movies',
        'games': 'games'
      },

      index: () => {
        console.log("routers.Quotes/index");

        Page.count = DATA.length;
        Paginator.update();

        let quotes = new collections.Quotes(
          DATA.map(quote => new models.Quote(quote))
        ).page({ number: Page.number() });

        (new views.Quotes({
          collection: quotes
        })).render();
      },

      movies: () => {
        console.log("routers.Quotes/movies");
        data = DATA.filter(datum => datum['theme'] == 'movies');

        Page.count = data.length;
        Paginator.update({ filter: 'movies' });

        let quotes = new collections.Quotes(
          data.map(quote => new models.Quote(quote))
        ).page({ number: Page.number() });

        (new views.Quotes({
          collection: quotes
        })).render();
      },

      games: () => {
        console.log('routers.Quotes/games');
        // TODO: Remove duplication of route initialization
        // TODO: Cache the fetched data

        data = DATA.filter(datum => datum['theme'] == 'games');

        Page.count = data.length;
        Paginator.update({ filter: 'games' });

        let quotes = new collections.Quotes(
          data.map(quote => new models.Quote(quote))
        ).page({ number: Page.number() });

        (new views.Quotes({
          collection: quotes
        })).render();
      },
    })
  };

  const Page = {
    limit: 15,
    count: 0,
    pages: () => { return Math.ceil(Page.count / Page.limit); },
    number: function () {
      let matches = location.search.match(/page=(\d+)/gi)
      if (matches == null || matches.length == 0) { return 1; };
      let number = Number(_.head(_.head(matches).match(/\d+/gi)));
      if (number <= 0) { return 1; }
      return number;
    }
  }

  const Paginator = {
    update: ({ filter = "" } = {}) => {
      let pages = Page.pages();
      let current = Page.number();
      if (current > pages) {
        current = pages;
      }

      (new views.Paginator({
        model: new models.Paginator({
          pages: pages,
          filter: filter,
          current: current
        })
      })).render();
    }
  };

  return function () {
    new routers.Quotes();
    Backbone.history.start({pushState: true});
  }
};

$(function () {
  const quotes_url = 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json';
  // const quotes_url = '/data/quotes.json';

  $.getJSON(quotes_url, null)
    .done((data) => {
      DATA = data;
      Quotes();
    });
  //.fail()
  //.always(data.Index.completed);
});
