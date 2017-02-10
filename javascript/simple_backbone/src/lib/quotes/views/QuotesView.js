import {QuoteView} from "./QuoteView";

export const QuotesView = Backbone.View.extend({
  el: "section.quotes",
  template: _.template($("#quotes-template").html()),
  initialize: () => console.log("views.Quotes/initialize"),
  render: function () {
    console.log("views.Quotes/render");

    this.$el.html(
      this.template({
        collection: this.collection.map((quote) => (new QuoteView({
          model: quote
        })).render().$el.html())
      })
    );

    return this;
  }
});
