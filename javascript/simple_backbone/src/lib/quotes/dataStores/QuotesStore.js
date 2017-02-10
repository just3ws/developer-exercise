const CACHE_KEY = "coding-exercise-003/quotes";

export const QuotesStore = (json = null) => {
  console.log("QuotesStore/initialize");

  if (json != null) {
    console.log("QuotesStore/initialize # Loading JSON into localStorage");
    localStorage.setItem(CACHE_KEY, JSON.stringify(json));
  }

  return new function () {
    let data = JSON.parse(localStorage.getItem(CACHE_KEY));

    return {
      loadJSON: (d) => localStorage.setItem(CACHE_KEY, JSON.stringify(d)),
      all: () => data,
      where: (predicate) => {

        console.log(`QuotesStore/where [${predicate}]`);
        if (predicate == null) {
          return data;
        } else {
          return data.filter(quote => predicate(quote));
        }
      },
      present: () => data != null && data.length > 0,
      empty: () => data == null || data.length == 0
    };
  };
};
