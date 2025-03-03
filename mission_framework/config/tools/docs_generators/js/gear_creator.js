/*
 *  Gear creator made for MalFramework script library for Arma 3.
 *
 *  GitHub: https://github.com/Malbryn/MalFramework
 */

// Output array
let gearArrays = []

/*
 *  Generates the gear template.
 */
function generateOutput() {
    let cards = $('.main-form-container').find("div[id^='card_']")

    Array.from(cards).forEach((e) => {
        let formElements = $(e).find('.user-input')
        let gearArray = []

        // Log the ID of each form element
        Array.from(formElements).forEach((e) => {
            console.log(e.id) // Add this line
            gearArray.push(convertLineBreaks($(e).val()))
        })

        gearArrays.push(gearArray)
    })

    let template = `/* This gear file was generated with the gear Creator tool
Create a loadout in the ACE Arsenal, click 'Export' and then paste the exported array.

Use selectRandom to randomise stuff.
Example:

case "SL" : {
_randomStuff = selectRandom ["stuff1_classname", "stuff2_classname"];

_gear = [
...,
_randomStuff,
...
];
};
*/

${formatGearArrays(gearArrays)}`

    // Display output
    $('#output').val(template)
    $('#output-field').css('display', 'flex')

    // Scroll down
    $('#output-field')[0].scrollIntoView({
        behavior: 'smooth',
        block: 'start',
    })
    // Reset output
    gearArrays = []
}

/**
 *  Format the output array.
 */

const comments = [
    '// Primary Weapon',
    '// Launcher',
    '// Secondary Weapon',
    '// Uniform',
    '// Vest',
    '// Backpack',
    '// Helmet',
    '// Facewear',
    '// Binos',
    '// Linked Items',
]

function formatGearArrays(gearArrays) {
    let templateString = ''

    for (let i = 0; i < gearArrays.length; i++) {
        let arsenalExport = gearArrays[i][1]
        let role = gearArrays[i][0]

        const replacedStr = arsenalExport.replace(/"/g, '"') // Replace " with " because JSON.parse() doesn't like it.
        const arr = JSON.parse(replacedStr)

        templateString += `case "${role}" : {\n\t_gear = [\n`

        let loadout = arr[0]

        for (let k = 0; k < Math.min(loadout.length, 10); k++) {
            let item = loadout[k]
            templateString += '\t\t' + comments[k] + '\n'
            templateString += '\t\t' + JSON.stringify(item)
            if (k < Math.min(loadout.length, 10) - 1) {
                templateString += ',\n'
            } else {
                templateString += '\n'
            }
        }

        templateString += `\t];\n};\n\n\n`
    }

    return templateString
}
