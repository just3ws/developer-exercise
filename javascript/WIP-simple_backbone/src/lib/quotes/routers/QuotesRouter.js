import {Index as QuotesIndex} from "./../controllers/QuotesController";

import {PageNumberModel} from "./../models/PageNumberModel";
import {PageNumberView} from "./../views/PageNumberView";

export const QuotesRouter = Backbone.Router.extend({

  //new RegExp(/^(games)(.+page=(\d+)?)?/, "i"): "games",
  //new RegExp(/^(movies)(.+page=(\d+)?)?/, "i"): "movies",
  routes: {
    "": "index",
    "movies*?queryString": "movies",
    "games*?queryString": "games",
    "movies": "movies",
    "games": "games"
  },
  route: function(route, name, callback) {
    return Backbone.Router.prototype.route.call(this, route, name, () => {
      // Pre-action
      console.log("Pre-action >>");
      console.log(route);
      console.log(name);

      // Action 
      (callback || this[name]).apply(this, arguments);

      // Post-action
      (new PageNumberView({ model: new PageNumberModel() })).render();
    }
    );
  },
  index: new QuotesIndex(),
  movies: new QuotesIndex({ theme: "movies" }),
  games: new QuotesIndex({ theme: "games" })
});
