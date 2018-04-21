console.log('Running conversations script...')

$('#message_content').keyup(toggleSubmit)
$('#message_content').change(toggleSubmit)

function toggleSubmit() {
  const submit = $("input[type='submit']")
  console.log(this)
  if (this.value === '') {
    console.log('Disable submit button')
    submit.attr('disabled', 'disabled')
  } else {
    console.log('Enable submit button')
    submit.removeAttr('disabled')
  }
}

