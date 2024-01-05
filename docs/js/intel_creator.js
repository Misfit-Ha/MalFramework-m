/*
 *  Intel creator made for MalFramework script library for Arma 3.
 *
 *  GitHub: https://github.com/Malbryn/MalFramework
 */

// Output array
let output = []

/*
 *  Generates the intel template.
 */
function generateOutput() {
    let cards = $('.main-form-container').find("div[id^='card_']")

    Array.from(cards).forEach((e) => {
        let formElements = $(e).find('.user-input')
        let intelArray = []

        Array.from(formElements).forEach((e) => {
            intelArray.push(
                $(e).attr('type') === 'checkbox'
                    ? $(e).prop('checked')
                    : convertLineBreaks($(e).val())
            )
        })

        // Convert the duration to integer
        intelArray[2] = parseInt(intelArray[2])

        output.push(intelArray)
    })

    let template = `// This intel file was generated with the Intel Creator tool

EGVAR(intel,intelList) = [${formatOutput(output)}];
    `

    // Display output
    $('#output').val(template)
    $('#output-field').css('display', 'flex')

    // Scroll down
    $('#output-field')[0].scrollIntoView({
        behavior: 'smooth',
        block: 'start',
    })

    // Reset output
    output = []
}

/*
 *  Format the output array.
 */
function formatOutput(output) {
    let templateString = ''

    output.forEach((e) => {
        templateString +=
            '["' +
            e[0] +
            '", "' +
            e[1] +
            '", ' +
            e[2] +
            ', ' +
            e[3] +
            ', ' +
            e[4] +
            '], '
    })

    // Delete the last comma
    templateString = templateString.slice(0, -2)

    return templateString
}
