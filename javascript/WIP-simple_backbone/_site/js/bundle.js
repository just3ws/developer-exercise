/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.l = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };

/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};

/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};

/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 11);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var QuoteModel = exports.QuoteModel = Backbone.Model.extend({
  toJSON: function toJSON() {
    var attrs = this.attributes;
    attrs.key = this.key();
    return attrs;
  },
  key: function key() {
    var _this = this;

    return ["theme", "context", "source", "quote"].map(function (attr) {
      return _this.get(attr).toLowerCase().replace(/\W/gi, " ").trim().replace(/\s+/gi, "-").replace(/\-{2,}/gi, "-");
    }).join(":");
  }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL21vZGVscy9RdW90ZU1vZGVsLmpzIl0sIm5hbWVzIjpbIlF1b3RlTW9kZWwiLCJCYWNrYm9uZSIsIk1vZGVsIiwiZXh0ZW5kIiwidG9KU09OIiwiYXR0cnMiLCJhdHRyaWJ1dGVzIiwia2V5IiwibWFwIiwiYXR0ciIsImdldCIsInRvTG93ZXJDYXNlIiwicmVwbGFjZSIsInRyaW0iLCJqb2luIl0sIm1hcHBpbmdzIjoiOzs7OztBQUFPLElBQU1BLGtDQUFhQyxTQUFTQyxLQUFULENBQWVDLE1BQWYsQ0FBc0I7QUFDOUNDLFVBQVEsa0JBQVc7QUFDakIsUUFBTUMsUUFBUSxLQUFLQyxVQUFuQjtBQUNBRCxVQUFNRSxHQUFOLEdBQVksS0FBS0EsR0FBTCxFQUFaO0FBQ0EsV0FBT0YsS0FBUDtBQUNELEdBTDZDO0FBTTlDRSxPQUFLLGVBQVk7QUFBQTs7QUFDZixXQUFPLENBQUMsT0FBRCxFQUFVLFNBQVYsRUFBcUIsUUFBckIsRUFBK0IsT0FBL0IsRUFDSkMsR0FESSxDQUNBLFVBQUNDLElBQUQ7QUFBQSxhQUFVLE1BQUtDLEdBQUwsQ0FBU0QsSUFBVCxFQUNiRSxXQURhLEdBRWJDLE9BRmEsQ0FFTCxNQUZLLEVBRUcsR0FGSCxFQUdiQyxJQUhhLEdBSWJELE9BSmEsQ0FJTCxPQUpLLEVBSUksR0FKSixFQUtiQSxPQUxhLENBS0wsVUFMSyxFQUtPLEdBTFAsQ0FBVjtBQUFBLEtBREEsRUFNdUJFLElBTnZCLENBTTRCLEdBTjVCLENBQVA7QUFPRDtBQWQ2QyxDQUF0QixDQUFuQiIsImZpbGUiOiJRdW90ZU1vZGVsLmpzIiwic291cmNlc0NvbnRlbnQiOlsiZXhwb3J0IGNvbnN0IFF1b3RlTW9kZWwgPSBCYWNrYm9uZS5Nb2RlbC5leHRlbmQoe1xuICB0b0pTT046IGZ1bmN0aW9uKCkge1xuICAgIGNvbnN0IGF0dHJzID0gdGhpcy5hdHRyaWJ1dGVzO1xuICAgIGF0dHJzLmtleSA9IHRoaXMua2V5KCk7XG4gICAgcmV0dXJuIGF0dHJzO1xuICB9LFxuICBrZXk6IGZ1bmN0aW9uICgpIHtcbiAgICByZXR1cm4gW1widGhlbWVcIiwgXCJjb250ZXh0XCIsIFwic291cmNlXCIsIFwicXVvdGVcIl1cbiAgICAgIC5tYXAoKGF0dHIpID0+IHRoaXMuZ2V0KGF0dHIpLlxuICAgICAgICB0b0xvd2VyQ2FzZSgpLlxuICAgICAgICByZXBsYWNlKC9cXFcvZ2ksIFwiIFwiKS5cbiAgICAgICAgdHJpbSgpLlxuICAgICAgICByZXBsYWNlKC9cXHMrL2dpLCBcIi1cIikuXG4gICAgICAgIHJlcGxhY2UoL1xcLXsyLH0vZ2ksIFwiLVwiKSkuam9pbihcIjpcIik7XG4gIH1cbn0pO1xuIl19

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var CACHE_KEY = "coding-exercise-003/quotes";

var QuotesStore = exports.QuotesStore = function QuotesStore() {
  var json = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;

  console.log("QuotesStore/initialize");

  if (json != null) {
    console.log("QuotesStore/initialize # Loading JSON into localStorage");
    localStorage.setItem(CACHE_KEY, JSON.stringify(json));
  }

  return new function () {
    var data = JSON.parse(localStorage.getItem(CACHE_KEY));

    return {
      loadJSON: function loadJSON(d) {
        return localStorage.setItem(CACHE_KEY, JSON.stringify(d));
      },
      all: function all() {
        return data;
      },
      where: function where(predicate) {

        console.log("QuotesStore/where [" + predicate + "]");
        if (predicate == null) {
          return data;
        } else {
          return data.filter(function (quote) {
            return predicate(quote);
          });
        }
      },
      present: function present() {
        return data != null && data.length > 0;
      },
      empty: function empty() {
        return data == null || data.length == 0;
      }
    };
  }();
};
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL2RhdGFTdG9yZXMvUXVvdGVzU3RvcmUuanMiXSwibmFtZXMiOlsiQ0FDSEVfS0VZIiwiUXVvdGVzU3RvcmUiLCJqc29uIiwiY29uc29sZSIsImxvZyIsImxvY2FsU3RvcmFnZSIsInNldEl0ZW0iLCJKU09OIiwic3RyaW5naWZ5IiwiZGF0YSIsInBhcnNlIiwiZ2V0SXRlbSIsImxvYWRKU09OIiwiZCIsImFsbCIsIndoZXJlIiwicHJlZGljYXRlIiwiZmlsdGVyIiwicXVvdGUiLCJwcmVzZW50IiwibGVuZ3RoIiwiZW1wdHkiXSwibWFwcGluZ3MiOiI7Ozs7O0FBQUEsSUFBTUEsWUFBWSw0QkFBbEI7O0FBRU8sSUFBTUMsb0NBQWMsU0FBZEEsV0FBYyxHQUFpQjtBQUFBLE1BQWhCQyxJQUFnQix1RUFBVCxJQUFTOztBQUMxQ0MsVUFBUUMsR0FBUixDQUFZLHdCQUFaOztBQUVBLE1BQUlGLFFBQVEsSUFBWixFQUFrQjtBQUNoQkMsWUFBUUMsR0FBUixDQUFZLHlEQUFaO0FBQ0FDLGlCQUFhQyxPQUFiLENBQXFCTixTQUFyQixFQUFnQ08sS0FBS0MsU0FBTCxDQUFlTixJQUFmLENBQWhDO0FBQ0Q7O0FBRUQsU0FBTyxJQUFJLFlBQVk7QUFDckIsUUFBSU8sT0FBT0YsS0FBS0csS0FBTCxDQUFXTCxhQUFhTSxPQUFiLENBQXFCWCxTQUFyQixDQUFYLENBQVg7O0FBRUEsV0FBTztBQUNMWSxnQkFBVSxrQkFBQ0MsQ0FBRDtBQUFBLGVBQU9SLGFBQWFDLE9BQWIsQ0FBcUJOLFNBQXJCLEVBQWdDTyxLQUFLQyxTQUFMLENBQWVLLENBQWYsQ0FBaEMsQ0FBUDtBQUFBLE9BREw7QUFFTEMsV0FBSztBQUFBLGVBQU1MLElBQU47QUFBQSxPQUZBO0FBR0xNLGFBQU8sZUFBQ0MsU0FBRCxFQUFlOztBQUVwQmIsZ0JBQVFDLEdBQVIseUJBQWtDWSxTQUFsQztBQUNBLFlBQUlBLGFBQWEsSUFBakIsRUFBdUI7QUFDckIsaUJBQU9QLElBQVA7QUFDRCxTQUZELE1BRU87QUFDTCxpQkFBT0EsS0FBS1EsTUFBTCxDQUFZO0FBQUEsbUJBQVNELFVBQVVFLEtBQVYsQ0FBVDtBQUFBLFdBQVosQ0FBUDtBQUNEO0FBQ0YsT0FYSTtBQVlMQyxlQUFTO0FBQUEsZUFBTVYsUUFBUSxJQUFSLElBQWdCQSxLQUFLVyxNQUFMLEdBQWMsQ0FBcEM7QUFBQSxPQVpKO0FBYUxDLGFBQU87QUFBQSxlQUFNWixRQUFRLElBQVIsSUFBZ0JBLEtBQUtXLE1BQUwsSUFBZSxDQUFyQztBQUFBO0FBYkYsS0FBUDtBQWVELEdBbEJNLEVBQVA7QUFtQkQsQ0EzQk0iLCJmaWxlIjoiUXVvdGVzU3RvcmUuanMiLCJzb3VyY2VzQ29udGVudCI6WyJjb25zdCBDQUNIRV9LRVkgPSBcImNvZGluZy1leGVyY2lzZS0wMDMvcXVvdGVzXCI7XG5cbmV4cG9ydCBjb25zdCBRdW90ZXNTdG9yZSA9IChqc29uID0gbnVsbCkgPT4ge1xuICBjb25zb2xlLmxvZyhcIlF1b3Rlc1N0b3JlL2luaXRpYWxpemVcIik7XG5cbiAgaWYgKGpzb24gIT0gbnVsbCkge1xuICAgIGNvbnNvbGUubG9nKFwiUXVvdGVzU3RvcmUvaW5pdGlhbGl6ZSAjIExvYWRpbmcgSlNPTiBpbnRvIGxvY2FsU3RvcmFnZVwiKTtcbiAgICBsb2NhbFN0b3JhZ2Uuc2V0SXRlbShDQUNIRV9LRVksIEpTT04uc3RyaW5naWZ5KGpzb24pKTtcbiAgfVxuXG4gIHJldHVybiBuZXcgZnVuY3Rpb24gKCkge1xuICAgIGxldCBkYXRhID0gSlNPTi5wYXJzZShsb2NhbFN0b3JhZ2UuZ2V0SXRlbShDQUNIRV9LRVkpKTtcblxuICAgIHJldHVybiB7XG4gICAgICBsb2FkSlNPTjogKGQpID0+IGxvY2FsU3RvcmFnZS5zZXRJdGVtKENBQ0hFX0tFWSwgSlNPTi5zdHJpbmdpZnkoZCkpLFxuICAgICAgYWxsOiAoKSA9PiBkYXRhLFxuICAgICAgd2hlcmU6IChwcmVkaWNhdGUpID0+IHtcblxuICAgICAgICBjb25zb2xlLmxvZyhgUXVvdGVzU3RvcmUvd2hlcmUgWyR7cHJlZGljYXRlfV1gKTtcbiAgICAgICAgaWYgKHByZWRpY2F0ZSA9PSBudWxsKSB7XG4gICAgICAgICAgcmV0dXJuIGRhdGE7XG4gICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgcmV0dXJuIGRhdGEuZmlsdGVyKHF1b3RlID0+IHByZWRpY2F0ZShxdW90ZSkpO1xuICAgICAgICB9XG4gICAgICB9LFxuICAgICAgcHJlc2VudDogKCkgPT4gZGF0YSAhPSBudWxsICYmIGRhdGEubGVuZ3RoID4gMCxcbiAgICAgIGVtcHR5OiAoKSA9PiBkYXRhID09IG51bGwgfHwgZGF0YS5sZW5ndGggPT0gMFxuICAgIH07XG4gIH07XG59O1xuIl19

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var PageNumberModel = exports.PageNumberModel = Backbone.Model.extend({
  toJSON: function toJSON() {
    var attrs = this.attributes;
    attrs.current = this.current();
    return attrs;
  },
  current: function current() {
    var matches = location.search.match(/page=(\d+)/gi);
    if (matches == null || matches.length == 0) {
      return 1;
    }
    var number = Number(matches[0].match(/\d+/)[0]);
    if (number <= 0) {
      return 1;
    }
    return number;
  }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL21vZGVscy9QYWdlTnVtYmVyTW9kZWwuanMiXSwibmFtZXMiOlsiUGFnZU51bWJlck1vZGVsIiwiQmFja2JvbmUiLCJNb2RlbCIsImV4dGVuZCIsInRvSlNPTiIsImF0dHJzIiwiYXR0cmlidXRlcyIsImN1cnJlbnQiLCJtYXRjaGVzIiwibG9jYXRpb24iLCJzZWFyY2giLCJtYXRjaCIsImxlbmd0aCIsIm51bWJlciIsIk51bWJlciJdLCJtYXBwaW5ncyI6Ijs7Ozs7QUFBTyxJQUFNQSw0Q0FBa0JDLFNBQVNDLEtBQVQsQ0FBZUMsTUFBZixDQUFzQjtBQUNuREMsVUFBUSxrQkFBVztBQUNqQixRQUFNQyxRQUFRLEtBQUtDLFVBQW5CO0FBQ0FELFVBQU1FLE9BQU4sR0FBZ0IsS0FBS0EsT0FBTCxFQUFoQjtBQUNBLFdBQU9GLEtBQVA7QUFDRCxHQUxrRDtBQU1uREUsV0FBUyxtQkFBTTtBQUNiLFFBQU1DLFVBQVVDLFNBQVNDLE1BQVQsQ0FBZ0JDLEtBQWhCLENBQXNCLGNBQXRCLENBQWhCO0FBQ0EsUUFBSUgsV0FBVyxJQUFYLElBQW1CQSxRQUFRSSxNQUFSLElBQWtCLENBQXpDLEVBQTRDO0FBQUUsYUFBTyxDQUFQO0FBQVc7QUFDekQsUUFBTUMsU0FBU0MsT0FBT04sUUFBUSxDQUFSLEVBQVdHLEtBQVgsQ0FBaUIsS0FBakIsRUFBd0IsQ0FBeEIsQ0FBUCxDQUFmO0FBQ0EsUUFBSUUsVUFBVSxDQUFkLEVBQWlCO0FBQUUsYUFBTyxDQUFQO0FBQVc7QUFDOUIsV0FBT0EsTUFBUDtBQUNEO0FBWmtELENBQXRCLENBQXhCIiwiZmlsZSI6IlBhZ2VOdW1iZXJNb2RlbC5qcyIsInNvdXJjZXNDb250ZW50IjpbImV4cG9ydCBjb25zdCBQYWdlTnVtYmVyTW9kZWwgPSBCYWNrYm9uZS5Nb2RlbC5leHRlbmQoe1xuICB0b0pTT046IGZ1bmN0aW9uKCkge1xuICAgIGNvbnN0IGF0dHJzID0gdGhpcy5hdHRyaWJ1dGVzO1xuICAgIGF0dHJzLmN1cnJlbnQgPSB0aGlzLmN1cnJlbnQoKTtcbiAgICByZXR1cm4gYXR0cnM7XG4gIH0sXG4gIGN1cnJlbnQ6ICgpID0+IHtcbiAgICBjb25zdCBtYXRjaGVzID0gbG9jYXRpb24uc2VhcmNoLm1hdGNoKC9wYWdlPShcXGQrKS9naSk7XG4gICAgaWYgKG1hdGNoZXMgPT0gbnVsbCB8fCBtYXRjaGVzLmxlbmd0aCA9PSAwKSB7IHJldHVybiAxOyB9XG4gICAgY29uc3QgbnVtYmVyID0gTnVtYmVyKG1hdGNoZXNbMF0ubWF0Y2goL1xcZCsvKVswXSk7XG4gICAgaWYgKG51bWJlciA8PSAwKSB7IHJldHVybiAxOyB9XG4gICAgcmV0dXJuIG51bWJlcjtcbiAgfVxufSk7XG5cbiJdfQ==

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.main = main;

var _QuotesStore = __webpack_require__(1);

var _QuotesRouter = __webpack_require__(7);

var _location = __webpack_require__(4);

function apiEndpoint() {
  return (0, _location.IfDevEnv)({
    devEnv: "/data/quotes.json",
    prodEnv: "https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json"
  });
}

function main() {
  console.log("Quotes/main");

  return new Promise(function (resolve, reject) {
    var quotesDb = new _QuotesStore.QuotesStore();

    if (quotesDb.present()) {
      console.log("Quotes/preload # Read quotes from cache");
      resolve(new _QuotesRouter.QuotesRouter());
    } else {

      $.getJSON(apiEndpoint(), null).done(function (data) {
        console.log("Quotes/preload # Fetch quotes from service");

        quotesDb.loadJSON(data);

        resolve(new _QuotesRouter.QuotesRouter());
      });
    }
  });
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL1F1b3Rlcy5qcyJdLCJuYW1lcyI6WyJtYWluIiwiYXBpRW5kcG9pbnQiLCJkZXZFbnYiLCJwcm9kRW52IiwiY29uc29sZSIsImxvZyIsIlByb21pc2UiLCJyZXNvbHZlIiwicmVqZWN0IiwicXVvdGVzRGIiLCJwcmVzZW50IiwiJCIsImdldEpTT04iLCJkb25lIiwiZGF0YSIsImxvYWRKU09OIl0sIm1hcHBpbmdzIjoiOzs7OztRQVdnQkEsSSxHQUFBQSxJOztBQVhoQjs7QUFDQTs7QUFDQTs7QUFFQSxTQUFTQyxXQUFULEdBQXdCO0FBQ3RCLFNBQU8sd0JBQVM7QUFDZEMsWUFBUSxtQkFETTtBQUVkQyxhQUFVO0FBRkksR0FBVCxDQUFQO0FBSUQ7O0FBRU0sU0FBU0gsSUFBVCxHQUFpQjtBQUN0QkksVUFBUUMsR0FBUixDQUFZLGFBQVo7O0FBRUEsU0FBTyxJQUFJQyxPQUFKLENBQVksVUFBQ0MsT0FBRCxFQUFVQyxNQUFWLEVBQXFCO0FBQ3RDLFFBQU1DLFdBQVcsOEJBQWpCOztBQUVBLFFBQUlBLFNBQVNDLE9BQVQsRUFBSixFQUF3QjtBQUN0Qk4sY0FBUUMsR0FBUixDQUFZLHlDQUFaO0FBQ0FFLGNBQVEsZ0NBQVI7QUFDRCxLQUhELE1BR087O0FBRUxJLFFBQUVDLE9BQUYsQ0FBVVgsYUFBVixFQUF5QixJQUF6QixFQUNFWSxJQURGLENBQ08sVUFBQ0MsSUFBRCxFQUFVO0FBQ2JWLGdCQUFRQyxHQUFSLENBQVksNENBQVo7O0FBRUFJLGlCQUFTTSxRQUFULENBQWtCRCxJQUFsQjs7QUFFQVAsZ0JBQVEsZ0NBQVI7QUFDRCxPQVBIO0FBUUQ7QUFDRixHQWpCTSxDQUFQO0FBa0JEIiwiZmlsZSI6IlF1b3Rlcy5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7UXVvdGVzU3RvcmV9IGZyb20gXCIuL2RhdGFTdG9yZXMvUXVvdGVzU3RvcmVcIjtcbmltcG9ydCB7UXVvdGVzUm91dGVyfSBmcm9tIFwiLi9yb3V0ZXJzL1F1b3Rlc1JvdXRlclwiO1xuaW1wb3J0IHtJZkRldkVudn0gZnJvbSBcIi4uL2xvY2F0aW9uXCI7XG5cbmZ1bmN0aW9uIGFwaUVuZHBvaW50ICgpIHtcbiAgcmV0dXJuIElmRGV2RW52KHsgXG4gICAgZGV2RW52OiBcIi9kYXRhL3F1b3Rlcy5qc29uXCIsXG4gICAgcHJvZEVudjogIFwiaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbm9ueW1vdXMvOGY2MWE4NzMzZWQ3ZmE0MWM0ZWEvcmF3LzFlOTBmZDI3NDFiYjYzMTA1ODJlMzgyMmY1OTkyN2ViNTM1ZjZjNzMvcXVvdGVzLmpzb25cIlxuICB9KTtcbn0gXG5cbmV4cG9ydCBmdW5jdGlvbiBtYWluICgpIHtcbiAgY29uc29sZS5sb2coXCJRdW90ZXMvbWFpblwiKTtcblxuICByZXR1cm4gbmV3IFByb21pc2UoKHJlc29sdmUsIHJlamVjdCkgPT4ge1xuICAgIGNvbnN0IHF1b3Rlc0RiID0gbmV3IFF1b3Rlc1N0b3JlKCk7XG5cbiAgICBpZiAocXVvdGVzRGIucHJlc2VudCgpKSB7XG4gICAgICBjb25zb2xlLmxvZyhcIlF1b3Rlcy9wcmVsb2FkICMgUmVhZCBxdW90ZXMgZnJvbSBjYWNoZVwiKTtcbiAgICAgIHJlc29sdmUobmV3IFF1b3Rlc1JvdXRlcigpKTtcbiAgICB9IGVsc2Uge1xuXG4gICAgICAkLmdldEpTT04oYXBpRW5kcG9pbnQoKSwgbnVsbCkuXG4gICAgICAgIGRvbmUoKGRhdGEpID0+IHtcbiAgICAgICAgICBjb25zb2xlLmxvZyhcIlF1b3Rlcy9wcmVsb2FkICMgRmV0Y2ggcXVvdGVzIGZyb20gc2VydmljZVwiKTtcblxuICAgICAgICAgIHF1b3Rlc0RiLmxvYWRKU09OKGRhdGEpO1xuXG4gICAgICAgICAgcmVzb2x2ZShuZXcgUXVvdGVzUm91dGVyKCkpO1xuICAgICAgICB9KTtcbiAgICB9XG4gIH0pO1xufVxuIl19

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var IfDevEnv = exports.IfDevEnv = function IfDevEnv() {
  var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {},
      _ref$devEnv = _ref.devEnv,
      devEnv = _ref$devEnv === undefined ? null : _ref$devEnv,
      _ref$prodEnv = _ref.prodEnv,
      prodEnv = _ref$prodEnv === undefined ? null : _ref$prodEnv;

  if (/(localhost|127.0.0.1|\.dev$)/.test(window.location.hostname)) {
    return devEnv;
  }
  return prodEnv;
};
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9saWIvbG9jYXRpb24uanMiXSwibmFtZXMiOlsiSWZEZXZFbnYiLCJkZXZFbnYiLCJwcm9kRW52IiwidGVzdCIsIndpbmRvdyIsImxvY2F0aW9uIiwiaG9zdG5hbWUiXSwibWFwcGluZ3MiOiI7Ozs7O0FBQU8sSUFBTUEsOEJBQVcsU0FBWEEsUUFBVyxHQUE0QztBQUFBLGlGQUFQLEVBQU87QUFBQSx5QkFBekNDLE1BQXlDO0FBQUEsTUFBekNBLE1BQXlDLCtCQUFoQyxJQUFnQztBQUFBLDBCQUExQkMsT0FBMEI7QUFBQSxNQUExQkEsT0FBMEIsZ0NBQWhCLElBQWdCOztBQUNsRSxNQUFJLCtCQUErQkMsSUFBL0IsQ0FBb0NDLE9BQU9DLFFBQVAsQ0FBZ0JDLFFBQXBELENBQUosRUFBbUU7QUFDakUsV0FBT0wsTUFBUDtBQUNEO0FBQ0QsU0FBT0MsT0FBUDtBQUNELENBTE0iLCJmaWxlIjoibG9jYXRpb24uanMiLCJzb3VyY2VzQ29udGVudCI6WyJleHBvcnQgY29uc3QgSWZEZXZFbnYgPSAoeyBkZXZFbnYgPSBudWxsLCBwcm9kRW52ID0gbnVsbCB9ID0ge30pID0+IHtcbiAgaWYgKC8obG9jYWxob3N0fDEyNy4wLjAuMXxcXC5kZXYkKS8udGVzdCh3aW5kb3cubG9jYXRpb24uaG9zdG5hbWUpKSB7XG4gICAgcmV0dXJuIGRldkVudjtcbiAgfSBcbiAgcmV0dXJuIHByb2RFbnY7XG59O1xuIl19

/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.QuotesCollection = undefined;

var _QuoteModel = __webpack_require__(0);

var QuotesCollection = exports.QuotesCollection = Backbone.Collection.extend({
  model: _QuoteModel.QuoteModel,
  initialize: function initialize() {
    return console.log("collections.Quotes/initialize");
  },
  page: function page() {
    var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {},
        _ref$number = _ref.number,
        number = _ref$number === undefined ? 1 : _ref$number,
        _ref$limit = _ref.limit,
        limit = _ref$limit === undefined ? 15 : _ref$limit;

    console.log("QuotesCollection/page");

    return _(this.rest(limit * number)).first(limit);
  }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL2NvbGxlY3Rpb25zL1F1b3Rlc0NvbGxlY3Rpb24uanMiXSwibmFtZXMiOlsiUXVvdGVzQ29sbGVjdGlvbiIsIkJhY2tib25lIiwiQ29sbGVjdGlvbiIsImV4dGVuZCIsIm1vZGVsIiwiaW5pdGlhbGl6ZSIsImNvbnNvbGUiLCJsb2ciLCJwYWdlIiwibnVtYmVyIiwibGltaXQiLCJfIiwicmVzdCIsImZpcnN0Il0sIm1hcHBpbmdzIjoiOzs7Ozs7O0FBQUE7O0FBRU8sSUFBTUEsOENBQW1CQyxTQUFTQyxVQUFULENBQW9CQyxNQUFwQixDQUEyQjtBQUN6REMsK0JBRHlEO0FBRXpEQyxjQUFZO0FBQUEsV0FBTUMsUUFBUUMsR0FBUixDQUFZLCtCQUFaLENBQU47QUFBQSxHQUY2QztBQUd6REMsUUFBTSxnQkFBMEM7QUFBQSxtRkFBSixFQUFJO0FBQUEsMkJBQS9CQyxNQUErQjtBQUFBLFFBQS9CQSxNQUErQiwrQkFBdEIsQ0FBc0I7QUFBQSwwQkFBbkJDLEtBQW1CO0FBQUEsUUFBbkJBLEtBQW1CLDhCQUFYLEVBQVc7O0FBQzlDSixZQUFRQyxHQUFSLENBQVksdUJBQVo7O0FBRUEsV0FBT0ksRUFBRSxLQUFLQyxJQUFMLENBQVVGLFFBQVFELE1BQWxCLENBQUYsRUFBNkJJLEtBQTdCLENBQW1DSCxLQUFuQyxDQUFQO0FBQ0Q7QUFQd0QsQ0FBM0IsQ0FBekIiLCJmaWxlIjoiUXVvdGVzQ29sbGVjdGlvbi5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7UXVvdGVNb2RlbH0gZnJvbSBcIi4vLi4vbW9kZWxzL1F1b3RlTW9kZWxcIjtcblxuZXhwb3J0IGNvbnN0IFF1b3Rlc0NvbGxlY3Rpb24gPSBCYWNrYm9uZS5Db2xsZWN0aW9uLmV4dGVuZCh7XG4gIG1vZGVsOiBRdW90ZU1vZGVsLFxuICBpbml0aWFsaXplOiAoKSA9PiBjb25zb2xlLmxvZyhcImNvbGxlY3Rpb25zLlF1b3Rlcy9pbml0aWFsaXplXCIpLFxuICBwYWdlOiBmdW5jdGlvbih7IG51bWJlciA9IDEsIGxpbWl0ID0gMTUgfSA9IHt9KSB7XG4gICAgY29uc29sZS5sb2coXCJRdW90ZXNDb2xsZWN0aW9uL3BhZ2VcIik7XG5cbiAgICByZXR1cm4gXyh0aGlzLnJlc3QobGltaXQgKiBudW1iZXIpKS5maXJzdChsaW1pdCk7XG4gIH1cbn0pO1xuIl19

/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.Index = Index;

var _QuotesStore = __webpack_require__(1);

var _QuotesCollection = __webpack_require__(5);

var _QuoteModel = __webpack_require__(0);

var _QuotesView = __webpack_require__(10);

function Index() {
  var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {},
      _ref$theme = _ref.theme,
      theme = _ref$theme === undefined ? null : _ref$theme;

  console.log("QuotesController/Index { theme: " + theme + " }");

  return function () {
    var quotesDb = new _QuotesStore.QuotesStore();

    var quotes = new _QuotesCollection.QuotesCollection(quotesDb.where(theme == null ? null : function (quote) {
      if (quote.theme == theme) return quote;
    }).map(function (quote) {
      return new _QuoteModel.QuoteModel(quote);
    }));

    new _QuotesView.QuotesView({
      collection: quotes
    }).render();
  };
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL2NvbnRyb2xsZXJzL1F1b3Rlc0NvbnRyb2xsZXIuanMiXSwibmFtZXMiOlsiSW5kZXgiLCJ0aGVtZSIsImNvbnNvbGUiLCJsb2ciLCJxdW90ZXNEYiIsInF1b3RlcyIsIndoZXJlIiwicXVvdGUiLCJtYXAiLCJjb2xsZWN0aW9uIiwicmVuZGVyIl0sIm1hcHBpbmdzIjoiOzs7OztRQUtnQkEsSyxHQUFBQSxLOztBQUxoQjs7QUFDQTs7QUFDQTs7QUFDQTs7QUFFTyxTQUFTQSxLQUFULEdBQXVDO0FBQUEsaUZBQUosRUFBSTtBQUFBLHdCQUFyQkMsS0FBcUI7QUFBQSxNQUFyQkEsS0FBcUIsOEJBQWIsSUFBYTs7QUFDNUNDLFVBQVFDLEdBQVIsc0NBQStDRixLQUEvQzs7QUFFQSxTQUFPLFlBQU07QUFDWCxRQUFNRyxXQUFXLDhCQUFqQjs7QUFFQSxRQUFNQyxTQUFTLHVDQUNiRCxTQUNDRSxLQURELENBQ1FMLFNBQVMsSUFBVixHQUNILElBREcsR0FFSCxVQUFDTSxLQUFELEVBQVc7QUFBRSxVQUFJQSxNQUFNTixLQUFOLElBQWVBLEtBQW5CLEVBQTBCLE9BQU9NLEtBQVA7QUFBZSxLQUgxRCxFQUlDQyxHQUpELENBSUs7QUFBQSxhQUFTLDJCQUFlRCxLQUFmLENBQVQ7QUFBQSxLQUpMLENBRGEsQ0FBZjs7QUFRQywrQkFBZTtBQUNkRSxrQkFBWUo7QUFERSxLQUFmLENBQUQsQ0FFSUssTUFGSjtBQUdELEdBZEQ7QUFlRCIsImZpbGUiOiJRdW90ZXNDb250cm9sbGVyLmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHtRdW90ZXNTdG9yZX0gZnJvbSBcIi4vLi4vZGF0YVN0b3Jlcy9RdW90ZXNTdG9yZVwiO1xuaW1wb3J0IHtRdW90ZXNDb2xsZWN0aW9ufSBmcm9tIFwiLi8uLi9jb2xsZWN0aW9ucy9RdW90ZXNDb2xsZWN0aW9uXCI7XG5pbXBvcnQge1F1b3RlTW9kZWx9IGZyb20gXCIuLy4uL21vZGVscy9RdW90ZU1vZGVsXCI7XG5pbXBvcnQge1F1b3Rlc1ZpZXd9IGZyb20gXCIuLy4uL3ZpZXdzL1F1b3Rlc1ZpZXdcIjtcblxuZXhwb3J0IGZ1bmN0aW9uIEluZGV4ICh7IHRoZW1lID0gbnVsbCB9ID0ge30pIHtcbiAgY29uc29sZS5sb2coYFF1b3Rlc0NvbnRyb2xsZXIvSW5kZXggeyB0aGVtZTogJHt0aGVtZX0gfWApO1xuXG4gIHJldHVybiAoKSA9PiB7XG4gICAgY29uc3QgcXVvdGVzRGIgPSBuZXcgUXVvdGVzU3RvcmUoKTtcblxuICAgIGNvbnN0IHF1b3RlcyA9IG5ldyBRdW90ZXNDb2xsZWN0aW9uKFxuICAgICAgcXVvdGVzRGJcbiAgICAgIC53aGVyZSgodGhlbWUgPT0gbnVsbClcbiAgICAgICAgPyBudWxsXG4gICAgICAgIDogKHF1b3RlKSA9PiB7IGlmIChxdW90ZS50aGVtZSA9PSB0aGVtZSkgcmV0dXJuIHF1b3RlOyB9KVxuICAgICAgLm1hcChxdW90ZSA9PiBuZXcgUXVvdGVNb2RlbChxdW90ZSkpXG4gICAgKTtcblxuICAgIChuZXcgUXVvdGVzVmlldyh7XG4gICAgICBjb2xsZWN0aW9uOiBxdW90ZXNcbiAgICB9KSkucmVuZGVyKCk7XG4gIH07XG59XG4iXX0=

/***/ }),
/* 7 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.QuotesRouter = undefined;

var _QuotesController = __webpack_require__(6);

var _PageNumberModel = __webpack_require__(2);

var _PageNumberView = __webpack_require__(8);

var QuotesRouter = exports.QuotesRouter = Backbone.Router.extend({

  //new RegExp(/^(games)(.+page=(\d+)?)?/, "i"): "games",
  //new RegExp(/^(movies)(.+page=(\d+)?)?/, "i"): "movies",
  routes: {
    "": "index",
    "movies*?queryString": "movies",
    "games*?queryString": "games",
    "movies": "movies",
    "games": "games"
  },
  route: function route(_route, name, callback) {
    var _this = this,
        _arguments = arguments;

    return Backbone.Router.prototype.route.call(this, _route, name, function () {
      // Pre-action
      console.log("Pre-action >>");
      console.log(_route);
      console.log(name);

      // Action 
      (callback || _this[name]).apply(_this, _arguments);

      // Post-action
      new _PageNumberView.PageNumberView({ model: new _PageNumberModel.PageNumberModel() }).render();
    });
  },
  index: new _QuotesController.Index(),
  movies: new _QuotesController.Index({ theme: "movies" }),
  games: new _QuotesController.Index({ theme: "games" })
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL3JvdXRlcnMvUXVvdGVzUm91dGVyLmpzIl0sIm5hbWVzIjpbIlF1b3Rlc1JvdXRlciIsIkJhY2tib25lIiwiUm91dGVyIiwiZXh0ZW5kIiwicm91dGVzIiwicm91dGUiLCJuYW1lIiwiY2FsbGJhY2siLCJwcm90b3R5cGUiLCJjYWxsIiwiY29uc29sZSIsImxvZyIsImFwcGx5IiwibW9kZWwiLCJyZW5kZXIiLCJpbmRleCIsIm1vdmllcyIsInRoZW1lIiwiZ2FtZXMiXSwibWFwcGluZ3MiOiI7Ozs7Ozs7QUFBQTs7QUFFQTs7QUFDQTs7QUFFTyxJQUFNQSxzQ0FBZUMsU0FBU0MsTUFBVCxDQUFnQkMsTUFBaEIsQ0FBdUI7O0FBRWpEO0FBQ0E7QUFDQUMsVUFBUTtBQUNOLFFBQUksT0FERTtBQUVOLDJCQUF1QixRQUZqQjtBQUdOLDBCQUFzQixPQUhoQjtBQUlOLGNBQVUsUUFKSjtBQUtOLGFBQVM7QUFMSCxHQUp5QztBQVdqREMsU0FBTyxlQUFTQSxNQUFULEVBQWdCQyxJQUFoQixFQUFzQkMsUUFBdEIsRUFBZ0M7QUFBQTtBQUFBOztBQUNyQyxXQUFPTixTQUFTQyxNQUFULENBQWdCTSxTQUFoQixDQUEwQkgsS0FBMUIsQ0FBZ0NJLElBQWhDLENBQXFDLElBQXJDLEVBQTJDSixNQUEzQyxFQUFrREMsSUFBbEQsRUFBd0QsWUFBTTtBQUNuRTtBQUNBSSxjQUFRQyxHQUFSLENBQVksZUFBWjtBQUNBRCxjQUFRQyxHQUFSLENBQVlOLE1BQVo7QUFDQUssY0FBUUMsR0FBUixDQUFZTCxJQUFaOztBQUVBO0FBQ0EsT0FBQ0MsWUFBWSxNQUFLRCxJQUFMLENBQWIsRUFBeUJNLEtBQXpCOztBQUVBO0FBQ0MseUNBQW1CLEVBQUVDLE9BQU8sc0NBQVQsRUFBbkIsQ0FBRCxDQUF1REMsTUFBdkQ7QUFDRCxLQVhNLENBQVA7QUFhRCxHQXpCZ0Q7QUEwQmpEQyxTQUFPLDZCQTFCMEM7QUEyQmpEQyxVQUFRLDRCQUFnQixFQUFFQyxPQUFPLFFBQVQsRUFBaEIsQ0EzQnlDO0FBNEJqREMsU0FBTyw0QkFBZ0IsRUFBRUQsT0FBTyxPQUFULEVBQWhCO0FBNUIwQyxDQUF2QixDQUFyQiIsImZpbGUiOiJRdW90ZXNSb3V0ZXIuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQge0luZGV4IGFzIFF1b3Rlc0luZGV4fSBmcm9tIFwiLi8uLi9jb250cm9sbGVycy9RdW90ZXNDb250cm9sbGVyXCI7XG5cbmltcG9ydCB7UGFnZU51bWJlck1vZGVsfSBmcm9tIFwiLi8uLi9tb2RlbHMvUGFnZU51bWJlck1vZGVsXCI7XG5pbXBvcnQge1BhZ2VOdW1iZXJWaWV3fSBmcm9tIFwiLi8uLi92aWV3cy9QYWdlTnVtYmVyVmlld1wiO1xuXG5leHBvcnQgY29uc3QgUXVvdGVzUm91dGVyID0gQmFja2JvbmUuUm91dGVyLmV4dGVuZCh7XG5cbiAgLy9uZXcgUmVnRXhwKC9eKGdhbWVzKSguK3BhZ2U9KFxcZCspPyk/LywgXCJpXCIpOiBcImdhbWVzXCIsXG4gIC8vbmV3IFJlZ0V4cCgvXihtb3ZpZXMpKC4rcGFnZT0oXFxkKyk/KT8vLCBcImlcIik6IFwibW92aWVzXCIsXG4gIHJvdXRlczoge1xuICAgIFwiXCI6IFwiaW5kZXhcIixcbiAgICBcIm1vdmllcyo/cXVlcnlTdHJpbmdcIjogXCJtb3ZpZXNcIixcbiAgICBcImdhbWVzKj9xdWVyeVN0cmluZ1wiOiBcImdhbWVzXCIsXG4gICAgXCJtb3ZpZXNcIjogXCJtb3ZpZXNcIixcbiAgICBcImdhbWVzXCI6IFwiZ2FtZXNcIlxuICB9LFxuICByb3V0ZTogZnVuY3Rpb24ocm91dGUsIG5hbWUsIGNhbGxiYWNrKSB7XG4gICAgcmV0dXJuIEJhY2tib25lLlJvdXRlci5wcm90b3R5cGUucm91dGUuY2FsbCh0aGlzLCByb3V0ZSwgbmFtZSwgKCkgPT4ge1xuICAgICAgLy8gUHJlLWFjdGlvblxuICAgICAgY29uc29sZS5sb2coXCJQcmUtYWN0aW9uID4+XCIpO1xuICAgICAgY29uc29sZS5sb2cocm91dGUpO1xuICAgICAgY29uc29sZS5sb2cobmFtZSk7XG5cbiAgICAgIC8vIEFjdGlvbiBcbiAgICAgIChjYWxsYmFjayB8fCB0aGlzW25hbWVdKS5hcHBseSh0aGlzLCBhcmd1bWVudHMpO1xuXG4gICAgICAvLyBQb3N0LWFjdGlvblxuICAgICAgKG5ldyBQYWdlTnVtYmVyVmlldyh7IG1vZGVsOiBuZXcgUGFnZU51bWJlck1vZGVsKCkgfSkpLnJlbmRlcigpO1xuICAgIH1cbiAgICApO1xuICB9LFxuICBpbmRleDogbmV3IFF1b3Rlc0luZGV4KCksXG4gIG1vdmllczogbmV3IFF1b3Rlc0luZGV4KHsgdGhlbWU6IFwibW92aWVzXCIgfSksXG4gIGdhbWVzOiBuZXcgUXVvdGVzSW5kZXgoeyB0aGVtZTogXCJnYW1lc1wiIH0pXG59KTtcbiJdfQ==

/***/ }),
/* 8 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.PageNumberView = undefined;

var _PageNumberModel = __webpack_require__(2);

// nav.quotes
// #quotes-page-number-template

var PageNumberView = exports.PageNumberView = Backbone.View.extend({
  template: _.template($("#quotes-page-number-template").html()),
  el: "nav.quotes",
  model: _PageNumberModel.PageNumberModel,
  //
  // WARN: Backbone.js is probably not going to survive ECMAScript 6
  //       `render: () => {`
  //       Will trigger "this is undefined" error.
  //       More at https://github.com/rollup/rollup/wiki/Troubleshooting#this-is-undefined
  //
  render: function render() {
    console.log("PageNumberView/render");
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL3ZpZXdzL1BhZ2VOdW1iZXJWaWV3LmpzIl0sIm5hbWVzIjpbIlBhZ2VOdW1iZXJWaWV3IiwiQmFja2JvbmUiLCJWaWV3IiwiZXh0ZW5kIiwidGVtcGxhdGUiLCJfIiwiJCIsImh0bWwiLCJlbCIsIm1vZGVsIiwicmVuZGVyIiwiY29uc29sZSIsImxvZyIsIiRlbCIsInRvSlNPTiJdLCJtYXBwaW5ncyI6Ijs7Ozs7OztBQUFBOztBQUVBO0FBQ0E7O0FBRU8sSUFBTUEsMENBQWlCQyxTQUFTQyxJQUFULENBQWNDLE1BQWQsQ0FBcUI7QUFDakRDLFlBQVVDLEVBQUVELFFBQUYsQ0FBV0UsRUFBRSw4QkFBRixFQUFrQ0MsSUFBbEMsRUFBWCxDQUR1QztBQUVqREMsTUFBSSxZQUY2QztBQUdqREMseUNBSGlEO0FBSWpEO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBQyxVQUFRLGtCQUFZO0FBQ2xCQyxZQUFRQyxHQUFSLENBQVksdUJBQVo7QUFDQSxTQUFLQyxHQUFMLENBQVNOLElBQVQsQ0FBYyxLQUFLSCxRQUFMLENBQWMsS0FBS0ssS0FBTCxDQUFXSyxNQUFYLEVBQWQsQ0FBZDtBQUNBLFdBQU8sSUFBUDtBQUNEO0FBZGdELENBQXJCLENBQXZCIiwiZmlsZSI6IlBhZ2VOdW1iZXJWaWV3LmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHtQYWdlTnVtYmVyTW9kZWx9IGZyb20gXCIuLy4uL21vZGVscy9QYWdlTnVtYmVyTW9kZWxcIjtcblxuLy8gbmF2LnF1b3Rlc1xuLy8gI3F1b3Rlcy1wYWdlLW51bWJlci10ZW1wbGF0ZVxuXG5leHBvcnQgY29uc3QgUGFnZU51bWJlclZpZXcgPSBCYWNrYm9uZS5WaWV3LmV4dGVuZCh7XG4gIHRlbXBsYXRlOiBfLnRlbXBsYXRlKCQoXCIjcXVvdGVzLXBhZ2UtbnVtYmVyLXRlbXBsYXRlXCIpLmh0bWwoKSksXG4gIGVsOiBcIm5hdi5xdW90ZXNcIixcbiAgbW9kZWw6IFBhZ2VOdW1iZXJNb2RlbCxcbiAgLy9cbiAgLy8gV0FSTjogQmFja2JvbmUuanMgaXMgcHJvYmFibHkgbm90IGdvaW5nIHRvIHN1cnZpdmUgRUNNQVNjcmlwdCA2XG4gIC8vICAgICAgIGByZW5kZXI6ICgpID0+IHtgXG4gIC8vICAgICAgIFdpbGwgdHJpZ2dlciBcInRoaXMgaXMgdW5kZWZpbmVkXCIgZXJyb3IuXG4gIC8vICAgICAgIE1vcmUgYXQgaHR0cHM6Ly9naXRodWIuY29tL3JvbGx1cC9yb2xsdXAvd2lraS9Ucm91Ymxlc2hvb3RpbmcjdGhpcy1pcy11bmRlZmluZWRcbiAgLy9cbiAgcmVuZGVyOiBmdW5jdGlvbiAoKSB7XG4gICAgY29uc29sZS5sb2coXCJQYWdlTnVtYmVyVmlldy9yZW5kZXJcIik7XG4gICAgdGhpcy4kZWwuaHRtbCh0aGlzLnRlbXBsYXRlKHRoaXMubW9kZWwudG9KU09OKCkpKTtcbiAgICByZXR1cm4gdGhpcztcbiAgfVxufSk7XG4iXX0=

/***/ }),
/* 9 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.QuoteView = undefined;

var _QuoteModel = __webpack_require__(0);

var QuoteView = exports.QuoteView = Backbone.View.extend({
  template: _.template($("#quote-template").html()),
  model: _QuoteModel.QuoteModel,
  render: function render() {
    console.log("QuoteView/render");
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL3ZpZXdzL1F1b3RlVmlldy5qcyJdLCJuYW1lcyI6WyJRdW90ZVZpZXciLCJCYWNrYm9uZSIsIlZpZXciLCJleHRlbmQiLCJ0ZW1wbGF0ZSIsIl8iLCIkIiwiaHRtbCIsIm1vZGVsIiwicmVuZGVyIiwiY29uc29sZSIsImxvZyIsIiRlbCIsInRvSlNPTiJdLCJtYXBwaW5ncyI6Ijs7Ozs7OztBQUFBOztBQUVPLElBQU1BLGdDQUFZQyxTQUFTQyxJQUFULENBQWNDLE1BQWQsQ0FBcUI7QUFDNUNDLFlBQVVDLEVBQUVELFFBQUYsQ0FBV0UsRUFBRSxpQkFBRixFQUFxQkMsSUFBckIsRUFBWCxDQURrQztBQUU1Q0MsK0JBRjRDO0FBRzVDQyxVQUFRLGtCQUFZO0FBQ2xCQyxZQUFRQyxHQUFSLENBQVksa0JBQVo7QUFDQSxTQUFLQyxHQUFMLENBQVNMLElBQVQsQ0FBYyxLQUFLSCxRQUFMLENBQWMsS0FBS0ksS0FBTCxDQUFXSyxNQUFYLEVBQWQsQ0FBZDtBQUNBLFdBQU8sSUFBUDtBQUNEO0FBUDJDLENBQXJCLENBQWxCIiwiZmlsZSI6IlF1b3RlVmlldy5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7UXVvdGVNb2RlbH0gZnJvbSBcIi4vLi4vbW9kZWxzL1F1b3RlTW9kZWxcIjtcblxuZXhwb3J0IGNvbnN0IFF1b3RlVmlldyA9IEJhY2tib25lLlZpZXcuZXh0ZW5kKHtcbiAgdGVtcGxhdGU6IF8udGVtcGxhdGUoJChcIiNxdW90ZS10ZW1wbGF0ZVwiKS5odG1sKCkpLFxuICBtb2RlbDogUXVvdGVNb2RlbCxcbiAgcmVuZGVyOiBmdW5jdGlvbiAoKSB7XG4gICAgY29uc29sZS5sb2coXCJRdW90ZVZpZXcvcmVuZGVyXCIpO1xuICAgIHRoaXMuJGVsLmh0bWwodGhpcy50ZW1wbGF0ZSh0aGlzLm1vZGVsLnRvSlNPTigpKSk7XG4gICAgcmV0dXJuIHRoaXM7XG4gIH1cbn0pO1xuIl19

/***/ }),
/* 10 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.QuotesView = undefined;

var _QuoteView = __webpack_require__(9);

var QuotesView = exports.QuotesView = Backbone.View.extend({
  el: "section.quotes",
  template: _.template($("#quotes-template").html()),
  initialize: function initialize() {
    return console.log("views.Quotes/initialize");
  },
  render: function render() {
    console.log("views.Quotes/render");

    this.$el.html(this.template({
      collection: this.collection.map(function (quote) {
        return new _QuoteView.QuoteView({
          model: quote
        }).render().$el.html();
      })
    }));

    return this;
  }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9saWIvcXVvdGVzL3ZpZXdzL1F1b3Rlc1ZpZXcuanMiXSwibmFtZXMiOlsiUXVvdGVzVmlldyIsIkJhY2tib25lIiwiVmlldyIsImV4dGVuZCIsImVsIiwidGVtcGxhdGUiLCJfIiwiJCIsImh0bWwiLCJpbml0aWFsaXplIiwiY29uc29sZSIsImxvZyIsInJlbmRlciIsIiRlbCIsImNvbGxlY3Rpb24iLCJtYXAiLCJxdW90ZSIsIm1vZGVsIl0sIm1hcHBpbmdzIjoiOzs7Ozs7O0FBQUE7O0FBRU8sSUFBTUEsa0NBQWFDLFNBQVNDLElBQVQsQ0FBY0MsTUFBZCxDQUFxQjtBQUM3Q0MsTUFBSSxnQkFEeUM7QUFFN0NDLFlBQVVDLEVBQUVELFFBQUYsQ0FBV0UsRUFBRSxrQkFBRixFQUFzQkMsSUFBdEIsRUFBWCxDQUZtQztBQUc3Q0MsY0FBWTtBQUFBLFdBQU1DLFFBQVFDLEdBQVIsQ0FBWSx5QkFBWixDQUFOO0FBQUEsR0FIaUM7QUFJN0NDLFVBQVEsa0JBQVk7QUFDbEJGLFlBQVFDLEdBQVIsQ0FBWSxxQkFBWjs7QUFFQSxTQUFLRSxHQUFMLENBQVNMLElBQVQsQ0FDRSxLQUFLSCxRQUFMLENBQWM7QUFDWlMsa0JBQVksS0FBS0EsVUFBTCxDQUFnQkMsR0FBaEIsQ0FBb0IsVUFBQ0MsS0FBRDtBQUFBLGVBQVkseUJBQWM7QUFDeERDLGlCQUFPRDtBQURpRCxTQUFkLENBQUQsQ0FFdkNKLE1BRnVDLEdBRTlCQyxHQUY4QixDQUUxQkwsSUFGMEIsRUFBWDtBQUFBLE9BQXBCO0FBREEsS0FBZCxDQURGOztBQVFBLFdBQU8sSUFBUDtBQUNEO0FBaEI0QyxDQUFyQixDQUFuQiIsImZpbGUiOiJRdW90ZXNWaWV3LmpzIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHtRdW90ZVZpZXd9IGZyb20gXCIuL1F1b3RlVmlld1wiO1xuXG5leHBvcnQgY29uc3QgUXVvdGVzVmlldyA9IEJhY2tib25lLlZpZXcuZXh0ZW5kKHtcbiAgZWw6IFwic2VjdGlvbi5xdW90ZXNcIixcbiAgdGVtcGxhdGU6IF8udGVtcGxhdGUoJChcIiNxdW90ZXMtdGVtcGxhdGVcIikuaHRtbCgpKSxcbiAgaW5pdGlhbGl6ZTogKCkgPT4gY29uc29sZS5sb2coXCJ2aWV3cy5RdW90ZXMvaW5pdGlhbGl6ZVwiKSxcbiAgcmVuZGVyOiBmdW5jdGlvbiAoKSB7XG4gICAgY29uc29sZS5sb2coXCJ2aWV3cy5RdW90ZXMvcmVuZGVyXCIpO1xuXG4gICAgdGhpcy4kZWwuaHRtbChcbiAgICAgIHRoaXMudGVtcGxhdGUoe1xuICAgICAgICBjb2xsZWN0aW9uOiB0aGlzLmNvbGxlY3Rpb24ubWFwKChxdW90ZSkgPT4gKG5ldyBRdW90ZVZpZXcoe1xuICAgICAgICAgIG1vZGVsOiBxdW90ZVxuICAgICAgICB9KSkucmVuZGVyKCkuJGVsLmh0bWwoKSlcbiAgICAgIH0pXG4gICAgKTtcblxuICAgIHJldHVybiB0aGlzO1xuICB9XG59KTtcbiJdfQ==

/***/ }),
/* 11 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _Quotes = __webpack_require__(3);

$(function () {
  (0, _Quotes.main)().then(function (router) {
    console.log('QuotesApp#then');

    Backbone.history.start({ pushState: true });
  });
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9saWIvbWFpbi5qcyJdLCJuYW1lcyI6WyIkIiwidGhlbiIsInJvdXRlciIsImNvbnNvbGUiLCJsb2ciLCJCYWNrYm9uZSIsImhpc3RvcnkiLCJzdGFydCIsInB1c2hTdGF0ZSJdLCJtYXBwaW5ncyI6Ijs7QUFBQTs7QUFFQUEsRUFBRSxZQUFNO0FBQ04sc0JBQ0dDLElBREgsQ0FDUSxVQUFDQyxNQUFELEVBQVk7QUFDaEJDLFlBQVFDLEdBQVIsQ0FBWSxnQkFBWjs7QUFFQUMsYUFBU0MsT0FBVCxDQUFpQkMsS0FBakIsQ0FBdUIsRUFBRUMsV0FBVyxJQUFiLEVBQXZCO0FBQ0QsR0FMSDtBQU1ELENBUEQiLCJmaWxlIjoibWFpbi5qcyIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7bWFpbiBhcyBRdW90ZXNBcHB9IGZyb20gJy4vcXVvdGVzL1F1b3Rlcyc7XG5cbiQoKCkgPT4ge1xuICBRdW90ZXNBcHAoKVxuICAgIC50aGVuKChyb3V0ZXIpID0+IHtcbiAgICAgIGNvbnNvbGUubG9nKCdRdW90ZXNBcHAjdGhlbicpO1xuXG4gICAgICBCYWNrYm9uZS5oaXN0b3J5LnN0YXJ0KHsgcHVzaFN0YXRlOiB0cnVlIH0pO1xuICAgIH0pO1xufSk7XG4iXX0=

/***/ })
/******/ ]);