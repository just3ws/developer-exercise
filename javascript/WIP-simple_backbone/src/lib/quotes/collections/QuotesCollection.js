import {QuoteModel} from "./../models/QuoteModel";

export const QuotesCollection = Backbone.Collection.extend({
  model: QuoteModel,
  initialize: () => console.log("collections.Quotes/initialize"),
  page: function({ number = 1, limit = 15 } = {}) {
    console.log("QuotesCollection/page");

    return _(this.rest(limit * number)).first(limit);
  }
});
