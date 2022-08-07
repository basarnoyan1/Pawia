import 'dart:math';

var vowels = ["a", "e", "ı", "i", "u", "ü", "o", "ö"];

extension TurkishTools on String {
  String genitive(bool special) {
    var len = this.length;
    var result = this +
        (special ? "'" : "") +
        (vowels.contains(this[len - 1]) ? "n" : "");
    var indxs = [0];
    vowels.forEach((letter) {
      indxs.add(this.indexOf(letter));
    });

    var last_vowel = vowels[indxs.indexOf(indxs.reduce(max)) - 1];
    switch (last_vowel) {
      case "a":
      case "ı":
        return result + "ın";
      case "e":
      case "i":
        return result + "in";
      case "o":
      case "u":
        return result + "un";
      case "ö":
      case "ü":
        return result + "ün";
      default:
        return result + "ın";
    }
  }

  String possessive(bool special) {
    var len = this.length;
    var result = this +
        (special ? "'" : "") +
        (vowels.contains(this[len - 1]) ? "s" : "");
    var indxs = [0];
    vowels.forEach((letter) {
      indxs.add(this.indexOf(letter));
    });

    var last_vowel = vowels[indxs.indexOf(indxs.reduce(max)) - 1];
    switch (last_vowel) {
      case "a":
      case "ı":
        return result + "ı";
      case "e":
      case "i":
        return result + "i";
      case "o":
      case "u":
        return result + "u";
      case "ö":
      case "ü":
        return result + "ü";
      default:
        return result + "ı";
    }
  }
}
