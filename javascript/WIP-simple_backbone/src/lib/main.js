import {main as QuotesApp} from './quotes/Quotes';

$(() => {
  QuotesApp()
    .then((router) => {
      console.log('QuotesApp#then');

      Backbone.history.start({ pushState: true });
    });
});
