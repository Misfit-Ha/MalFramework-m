const currentRoute = window.location.pathname.split('/').pop()
const label = currentRoute === 'gear_creator.html' ? 'Loadout' : 'Intel'
console.log(currentRoute)
/*
 *  Adds a new Gear card.
 */

$('#add-form').on('click', function (e) {
    e.preventDefault()

    // Get the last child element and clone it
    let $lastCard = $("div[id^='card_']:last")
    let newID = parseInt($lastCard.prop('id').match(/\d+/g), 10) + 1
    let $cardClone = $lastCard.clone().prop('id', 'card_' + newID)
    let $cardCloneID = '#' + $cardClone.attr('id')

    // Append the clone to the form
    $('#main-form').append($cardClone)

    // Clear the input fields of the clone and change the ID
    clearForm($cardCloneID)
    setGearID($cardCloneID, label)
})

/*
 *  Removes the selected card.
 */

$('.main-form-container').on('click', '.card-remove', function (e) {
    e.preventDefault()

    $(this).closest('.card').remove()

    // Re-assign ID's
    refreshGearIDs()
})

/*
 *  Refreshes the gear IDs.
 */
function refreshGearIDs() {
    let cards = $('.main-form-container').find("div[id^='card_']")

    Array.from(cards).forEach(function (e, i) {
        setCardID(e, i)
    })
}

/*
 *  Event fired when the user submits the form.
 */
$('#main-form').submit((e) => {
    e.preventDefault()

    generateOutput()
})

/*
 *  Refreshes the ID of a card.
 */
function setCardID(oldID, index) {
    let newID = 'card_' + index

    $(oldID).prop('id', newID)
    setGearID('#' + newID, label)
}

/*
 *  Changes the card header according to the ID of the gear card.
 */
function setGearID(cardID, label) {
    let gearTitle = label + ' #' + cardID.split('_')[1]

    $(cardID).find('h3').html(gearTitle)
}

/*
 *  Clears the form after cloning it.
 */
function clearForm(cardID) {
    let formElements = $(cardID).find('.user-input')

    Array.from(formElements).forEach((e) => {
        $(e).attr('type') === 'checkbox'
            ? $(e).prop('checked', false)
            : $(e).val('')
    })
}

/*
 *  Converts the line breaks to "<br/>".
 */
function convertLineBreaks(str) {
    return str.split('\n').join('\n<br/>')
}

/*
 *  Copy to clipboard event fired when the user clicks the button.
 */
$('#copy-button').click((e) => {
    let text = $('#output')

    text.select()
    document.execCommand('copy')
    document.getSelection().removeAllRanges()

    // Button text
    $('#panel').slideDown('slow')

    setTimeout(function () {
        $('#panel').slideUp('slow')
    }, 3000)
})
