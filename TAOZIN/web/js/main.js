/*=============== SHOW SCROLL UP ===============*/ 
const scrollUp = () =>{
	const scrollUp = document.getElementById('scroll-up');
    // When the scroll is higher than 350 viewport height, add the show-scroll class to the a tag with the scrollup class
	this.scrollY >= 350 ? scrollUp.classList.add('show-scroll')
						: scrollUp.classList.remove('show-scroll');
};
window.addEventListener('scroll', scrollUp);


// Close popup 
const body = document.querySelector("body");
let modalContainer = document.querySelectorAll('.modal');
let modalBox = document.querySelectorAll('.mdl-cnt');
let formLogSign = document.querySelector('.forms');

// Click vùng ngoài sẽ tắt Popup
modalContainer.forEach(item => {
    item.addEventListener('click', closeModal);
});

modalBox.forEach(item => {
    item.addEventListener('click', function (event) {
        event.stopPropagation();
    });
});

function closeModal() {
    modalContainer.forEach(item => {
        item.classList.remove('open');
    });
    console.log(modalContainer);
    body.style.overflow = "auto";
}

function increasingNumber(e) {
    let qty = e.parentNode.querySelector('.input-qty');
    if (parseInt(qty.value) < qty.max) {
        qty.value = parseInt(qty.value) + 1;
    } else {
        qty.value = qty.max;
    }
}

function decreasingNumber(e) {
    let qty = e.parentNode.querySelector('.input-qty');
    if (qty.value > qty.min) {
        qty.value = parseInt(qty.value) - 1;
    } else {
        qty.value = qty.min;
    }
}

//Signup && Login Form

// Chuyen doi qua lai SignUp & Login 
let signup = document.querySelector('.signup-link');
let login = document.querySelector('.login-link');
let container = document.querySelector('.signup-login .modal-container');
login.addEventListener('click', () => {
    container.classList.add('active');
});

signup.addEventListener('click', () => {
    container.classList.remove('active');
});

//let signupbtn = document.getElementById('signup');
//let loginbtn = document.getElementById('login');
//let formsg = document.querySelector('.modal.signup-login');
//signupbtn.addEventListener('click', () => {
//    formsg.classList.add('open');
//    container.classList.remove('active');
//    body.style.overflow = "hidden";
//});

try {
    let signupbtn = document.getElementById('signup');
    let loginbtn = document.getElementById('login');
    let formsg = document.querySelector('.modal.signup-login');
    
    signupbtn.addEventListener('click', () => {
        try {
            formsg.classList.add('open');
            container.classList.remove('active');
            body.style.overflow = "hidden";
        } catch (error) {
            console.error("Lỗi khi xử lý sự kiện click:", error);
        }
    });
    
    loginbtn.addEventListener('click', () => {
    document.querySelector('.form-message-check-login').innerHTML = '';
    formsg.classList.add('open');
    container.classList.add('active');
    body.style.overflow = "hidden";
});
} catch (error) {
    console.error("Lỗi khi gán sự kiện:", error);
}

//loginbtn.addEventListener('click', () => {
//    document.querySelector('.form-message-check-login').innerHTML = '';
//    formsg.classList.add('open');
//    container.classList.add('active');
//    body.style.overflow = "hidden";
//});

//document.addEventListener("DOMContentLoaded", function () {
//    const toastContainer = document.getElementById("toast");
//    if (!toastContainer) return;
//
//    //Auto remove toast
//    const toasts = toastContainer.querySelectorAll(".toast");
//    toasts.forEach((toast) => {
//        const autoRemove = setTimeout(() => {
//            toast.remove();
//        }, 4000);
//
//        toast.dataset.autoRemove = autoRemove;
//    });
//
//    //Remove toast when click btn close
//    toastContainer.addEventListener("click", function (e) {
//        const closeBtn = e.target.closest(".toast__close");
//        if (closeBtn) {
//            const toast = closeBtn.closest(".toast");
//            clearTimeout(toast.dataset.autoRemove);
//            toast.remove();
//        }
//    });
//});

function initToast() {
    const toastContainer = document.getElementById("toast");
    if (!toastContainer) return;

    // Auto remove toast
    const toasts = toastContainer.querySelectorAll(".toast");
    toasts.forEach((toast) => {
        const autoRemove = setTimeout(() => {
            toast.remove();
        }, 4000);

        toast.dataset.autoRemove = autoRemove;
    });

    // Remove toast when click btn close
    toastContainer.addEventListener("click", function (e) {
        const closeBtn = e.target.closest(".toast__close");
        if (closeBtn) {
            const toast = closeBtn.closest(".toast");
            clearTimeout(toast.dataset.autoRemove);
            toast.remove();
        }
    });
}

document.addEventListener("DOMContentLoaded", initToast);

//Img Slider
function initSlider() {
    let slider = document.querySelector('.home-banner .list');
    let items = document.querySelectorAll('.home-banner .list .item');
    let next = document.getElementById('next');
    let prev = document.getElementById('prev');
    let dots = document.querySelectorAll('.home-banner .dots li');

    if (!slider || items.length === 0 || !next || !prev || dots.length === 0) {
        console.error("Không tìm thấy phần tử cần thiết.");
        return;
    }

    let lengthItems = items.length - 1;
    let active = 0;

    next.onclick = function () {
        active = active + 1 <= lengthItems ? active + 1 : 0;
        reloadSlider();
    };

    prev.onclick = function () {
        active = active - 1 >= 0 ? active - 1 : lengthItems;
        reloadSlider();
    };

    let refreshInterval = setInterval(() => {
        next.click();
    }, 5000);

    function reloadSlider() {
        let itemWidth = items[0].clientWidth;
        slider.style.transform = `translateX(-${active * itemWidth}px)`;

        // Cập nhật trạng thái dot
        let activeDot = document.querySelector('.home-banner .dots li.active');
        if (activeDot) activeDot.classList.remove('active');
        dots[active].classList.add('active');

        // Reset lại thời gian tự động chuyển slide
        clearInterval(refreshInterval);
        refreshInterval = setInterval(() => {
            next.click();
        }, 3000);
    }

    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            active = index;
            reloadSlider();
        });
    });

    window.onresize = function () {
        reloadSlider();
    };
}

document.addEventListener("DOMContentLoaded", initSlider);
