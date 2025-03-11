  document.getElementById('next').onclick = function(){
    const widthItem = document.querySelector('.col-product').offsetWidth;
    document.getElementById('formList').scrollLeft += widthItem;
};
document.getElementById('prev').onclick = function(){
    const widthItem = document.querySelector('.col-product').offsetWidth;
    document.getElementById('formList').scrollLeft -= widthItem;
};
  

