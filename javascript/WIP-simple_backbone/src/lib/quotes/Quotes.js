import {QuotesStore} from "./dataStores/QuotesStore";
import {QuotesRouter} from "./routers/QuotesRouter";
import {IfDevEnv} from "../location";

function apiEndpoint () {
  return IfDevEnv({ 
    devEnv: "/data/quotes.json",
    prodEnv:  "https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json"
  });
} 

export function main () {
  console.log("Quotes/main");

  return new Promise((resolve, reject) => {
    const quotesDb = new QuotesStore();

    if (quotesDb.present()) {
      console.log("Quotes/preload # Read quotes from cache");
      resolve(new QuotesRouter());
    } else {

      $.getJSON(apiEndpoint(), null).
        done((data) => {
          console.log("Quotes/preload # Fetch quotes from service");

          quotesDb.loadJSON(data);

          resolve(new QuotesRouter());
        });
    }
  });
}
