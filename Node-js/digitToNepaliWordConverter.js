var abc = 26482492959225;
console.log("Number = " + abc);

spellNumber(abc);
function spellNumber(number) {
    let spelledNumber = [];
    var numLength = number.toString().length;
    var nepaliNumberPlaceValue = [
        "सय", "हजार ", "लाख ", "करोड ", "अर्ब ", "खर्ब ", "निल ", "पद्म ", "शङ्ख "
    ];
    let wordList = [
        "",
        "एक",
        "दुई",
        "तीन",
        "चार",
        "पाँच",
        "छ",
        "सात",
        "आठ",
        "नौ",
        "दश",
        "एघार",
        "बाह्र",
        "तेह्र",
        "चौध",
        "पन्ध्र",
        "सोह्र",
        "सत्र",
        "अठार",
        "उन्नाइस",
        "विस",
        "एक्काइस",
        "बाईस",
        "तेईस",
        "चौबीस",
        "पच्चीस",
        "छब्बीस",
        "सत्ताईस",
        "अट्ठाईस",
        "उनन्तिस",
        "तिस",
        "एकत्तिस",
        "बत्तिस",
        "तेत्तिस",
        "चौँतिस",
        "पैँतिस",
        "छत्तिस",
        "सैँतीस",
        "अठतीस",
        "उनन्चालीस",
        "चालीस",
        "एकचालीस",
        "बयालीस",
        "त्रियालीस",
        "चवालीस",
        "पैँतालीस",
        "छयालीस",
        "सच्चालीस",
        "अठचालीस",
        "उनन्चास",
        "पचास",
        "एकाउन्न",
        "बाउन्न",
        "त्रिपन्न",
        "चउन्न",
        "पचपन्न",
        "छपन्न",
        "सन्ताउन्न",
        "अन्ठाउन्न",
        "उनन्साठी",
        "साठी",
        "एकसट्ठी",
        "बयसट्ठी",
        "त्रिसट्ठी",
        "चौंसट्ठी",
        "पैंसट्ठी",
        "छयसट्ठी",
        "सतसट्ठी",
        "अठसट्ठी",
        "उनन्सत्तरी",
        "सत्तरी",
        "एकहत्तर",
        "बहत्तर",
        "त्रिहत्तर",
        "चौहत्तर",
        "पचहत्तर",
        "छयहत्तर",
        "सतहत्तर",
        "अठहत्तर",
        "उनासी",
        "असी",
        "एकासी",
        "बयासी",
        "त्रियासी",
        "चौरासी",
        "पचासी",
        "छयासी",
        "सतासी",
        "अठासी",
        "उनान्नब्बे",
        "नब्बे",
        "एकान्नब्बे",
        "बयानब्बे",
        "त्रियान्नब्बे",
        "चौरान्नब्बे",
        "पन्चानब्बे",
        "छयान्नब्बे",
        "सन्तान्नब्बे",
        "अन्ठान्नब्बे",
        "उनान्सय",
    ];
    if (typeof (number) === "number") {
        let stringNumber = putCommaIn(number);
        numberArray = stringNumber.toString().split(",");
        console.log(numberArray.reverse());
        for (let index = 0; index < numberArray.length; index++) {
            if (index === 0) {

                spelledNumber.push(`${wordList[parseInt(numberArray[index].toString().slice(0, 1))]} सय ${wordList[parseInt(numberArray[index].toString().slice(1, 3))]}`);
            }
            else {
                spelledNumber.push(`${wordList[parseInt(numberArray.reverse()[index])]} ${nepaliNumberPlaceValue[index]}`);
            }
        }
    }
    else {
        return "Input a number please.";
    }
    console.log("अक्षरेपी रु " + spelledNumber.reverse().join('') + "मात्र ।");
    // अक्षरेपी रु दुई निल उनन्साठी खर्ब बयासी अर्ब उनन्चास करोड उनन्तिस लाख चौंसट्ठी हजार दुई सय पच्चीसमात्र ।
}

function putCommaIn(number) {
    if (typeof (number) === "number") {
        var digitsInNumber = [];
        var resultArray = [];
        var numberInToString = number.toString();
        for (let i = 0; i < numberInToString.length; i++) {
            digitsInNumber.push(numberInToString[i]);
        }
        digitsInNumber.reverse();
        var counterIndex = 0;
        digitsInNumber.forEach(digit => {
            resultArray.push(digit);
            if (counterIndex === 2) {
                resultArray.push(",");
            } else if (counterIndex >= 3 && counterIndex % 2 === 0) {
                if (counterIndex === digitsInNumber.length - 1) {
                } else {
                    resultArray.push(',');
                }
            }
            counterIndex += 1;
        }); return resultArray.reverse().join('');
    }
    else {
        console.log("Enter a valid number");
    }
}