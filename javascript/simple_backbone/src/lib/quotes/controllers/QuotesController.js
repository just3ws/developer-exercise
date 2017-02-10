import {QuotesStore} from "./../dataStores/QuotesStore";
import {QuotesCollection} from "./../collections/QuotesCollection";
import {QuoteModel} from "./../models/QuoteModel";
import {QuotesView} from "./../views/QuotesView";

export function Index ({ theme = null } = {}) {
  console.log(`QuotesController/Index { theme: ${theme} }`);

  return () => {
    const quotesDb = new QuotesStore();

    const quotes = new QuotesCollection(
      quotesDb
      .where((theme == null)
        ? null
        : (quote) => { if (quote.theme == theme) return quote; })
      .map(quote => new QuoteModel(quote))
    );

    (new QuotesView({
      collection: quotes
    })).render();
  };
}
