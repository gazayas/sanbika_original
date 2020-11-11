/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/key_change.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/key_change.js":
/*!********************************************!*\
  !*** ./app/javascript/packs/key_change.js ***!
  \********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/gabriel/ror/sanbika/app/javascript/packs/key_change.js: Unexpected token, expected \",\" (152:9)\n\n  150 |         $(() =>\n  151 |           $('.song_body').on('load', () => alert(\"oh\")//key_change($('#key_box').attr('class'), null))\n> 152 |         );\n      |          ^\n  153 |     }\n  154 | }\n  155 | \n    at Parser._raise (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:799:17)\n    at Parser.raiseWithData (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:792:17)\n    at Parser.raise (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:786:17)\n    at Parser.unexpected (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9089:16)\n    at Parser.expect (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9075:28)\n    at Parser.parseCallExpressionArguments (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10167:14)\n    at Parser.parseCoverCallAndAsyncArrowHead (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10092:29)\n    at Parser.parseSubscript (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:10028:19)\n    at Parser.parseSubscripts (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9999:19)\n    at Parser.parseExprSubscripts (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9982:17)\n    at Parser.parseUpdate (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9956:21)\n    at Parser.parseMaybeUnary (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9945:17)\n    at Parser.parseExprOps (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9815:23)\n    at Parser.parseMaybeConditional (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9789:23)\n    at Parser.parseMaybeAssign (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9752:21)\n    at Parser.parseExpressionBase (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9696:23)\n    at allowInAnd (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9690:39)\n    at Parser.allowInAnd (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11442:16)\n    at Parser.parseExpression (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:9690:17)\n    at Parser.parseStatementContent (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11708:23)\n    at Parser.parseStatement (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11577:17)\n    at Parser.parseBlockOrModuleBlockBody (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:12159:25)\n    at Parser.parseBlockBody (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:12145:10)\n    at Parser.parseBlock (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:12129:10)\n    at Parser.parseStatementContent (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11653:21)\n    at Parser.parseStatement (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11577:17)\n    at node.body.withTopicForbiddingContext (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:12202:60)\n    at Parser.withTopicForbiddingContext (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11417:14)\n    at Parser.parseFor (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:12202:22)\n    at Parser.parseForStatement (/home/gabriel/ror/sanbika/node_modules/@babel/parser/lib/index.js:11901:19)");

/***/ })

/******/ });
//# sourceMappingURL=key_change-15384877e25b22b7d249.js.map