//處理地址和取貨方式
const method = document.getElementById('method');
const address = document.getElementById('address');

method.addEventListener('change', () => {
    const way = method.value;
    if (way === 'self') {
    address.value = 'none'; 
    } else if (way === 'lazy') {
    address.value = 'home';
    
    }
});

address.addEventListener('change', () => {
    const selectedColor = address.value;
    if (selectedColor === 'home') {
    method.value = 'lazy'; 
    } else if (selectedColor === 'none') {
    method.value = 'self'; 
    } else {

    }
});


//付款方式
window.addEventListener('DOMContentLoaded', () => {
    const send = document.getElementById('send');
    const payment = document.getElementById('payment');
    const pop2 = document.getElementById('pop2');
    const pop = document.getElementById('pop');
    const closeButtons = document.querySelectorAll('.backOnce');
    const paid = document.querySelectorAll('.paid');


    payment.addEventListener('change', () => {
    const pay = payment.value;

    if (pay === 'online') {
        send.textContent = '確認結帳';
    } else if (pay === 'pay') {
        send.textContent = '送出訂單';
    }
    });   

    send.addEventListener('click', () => {
      if (send.textContent === '確認結帳') {
        pop.style.display = 'block';
      } else if (send.textContent === '送出訂單') {
        pop2.style.display = 'block';
      }
    });

    closeButtons.forEach((button) => {
        button.addEventListener('click', () => {
          pop.style.display = 'none';
          pop2.style.display = 'none';
        });
    });

    paid.forEach((button) => {
        button.addEventListener('click', () => {
          pop2.style.display = 'block';
        });
    });
});

//付款成功
const pop2 = document.getElementById('pop2');
var paid = document.getElementById("paid");

pay.onclick = function() {
    pop2.style.display = 'block';
}