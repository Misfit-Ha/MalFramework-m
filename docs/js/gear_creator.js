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

    Array.from(formElements).forEach((e) => {
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

// CTRG 2035

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
function formatGearArrays(gearArrays) {
  let templateString = ''
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

  for (let i = 0; i < gearArrays.length; i++) {
    let arsenalExport = gearArrays[i][1]
    let role = gearArrays[i][0]

    const replacedStr = arsenalExport.replace(/&amp;quot;/g, '"') // Replace &amp;quot; with " because JSON.parse() doesn't like it.
    const arr = JSON.parse(replacedStr)

    templateString += `case "${role}" : {\n\t_gear = [\n`

    for (let j = 0; j < arr.length; j++) {
      let loadout = arr[j]

      // loop through the 9 items.
      for (let k = 0; k < loadout.length; k++) {
        let item = loadout[k]
        templateString += '\t\t' + comments[k] + '\n'
        templateString += '\t\t' + JSON.stringify(item) + ',\n'
      }

      templateString = templateString.slice(0, -1)
    }

    templateString += `\n\t];\n};\n\n\n`
  }

  return templateString
}
