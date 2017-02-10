import {PageNumberModel} from "./../models/PageNumberModel";

// nav.quotes
// #quotes-page-number-template

export const PageNumberView = Backbone.View.extend({
  template: _.template($("#quotes-page-number-template").html()),
  el: "nav.quotes",
  model: PageNumberModel,
  //
  // WARN: Backbone.js is probably not going to survive ECMAScript 6
  //       `render: () => {`
  //       Will trigger "this is undefined" error.
  //       More at https://github.com/rollup/rollup/wiki/Troubleshooting#this-is-undefined
  //
  render: function () {
    console.log("PageNumberView/render");
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
