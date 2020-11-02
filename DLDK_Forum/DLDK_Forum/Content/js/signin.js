document.querySelector('.img-btn').addEventListener('click', function () {
    document.querySelector('.cont').classList.toggle('s-sign-up')
});


const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');

togglePassword.addEventListener('click', function (e) {
    const type = password.getAttribute('type') === 'text' ? 'password' : 'text';
    password.setAttribute('type', type);
    this.classList.toggle('fa-eye-slash');
});