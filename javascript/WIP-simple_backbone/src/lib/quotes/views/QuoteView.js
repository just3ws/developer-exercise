import {QuoteModel} from "./../models/QuoteModel";

export const QuoteView = Backbone.View.extend({
  template: _.template($("#quote-template").html()),
  model: QuoteModel,
  render: function () {
    console.log("QuoteView/render");
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
