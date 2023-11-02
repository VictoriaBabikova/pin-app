<div class="container-product">
    <div class="container-form">
        <h2>Добавить продукт</h2>
        <form action="" class="product-form" method="post" id="formId">
            <label for ="article">Артикул</label> 
            <input type="text" name="article" required value="" class="input">
            <div class="error" id="error_article"></div>
            <label for ="name">Название</label> 
            <input type="text" name="name" required value="" class="input">
            <div class="error" id="error_name"></div>
            <label for ="status">Статус</label>
            <select class="form-select" name="status" id="status">
                <option value="available" selected>Доступен</option>
                <option value="available">Доступен</option>
                <option value="unavailable">Не доступен</option>
            </select>
            <h4>Атрибуты</h4>
            <div id="vendor-body">
                <button type="button" class="btn-add-vendor" id="vendor">+ Добавить атрибут</button>
                <div id="vendor-cont">
                </div>
            </div>
            <input type="submit" value="Добавить" class="product-btn" style="border: none" id="store_new_prod">
        </form> 
    </div>
    <div class="close-btn">
        <a href="{{route('products.index')}}">
            <img src="/images/Close_round.svg" alt="close_button" width="30px">
        </a>
    </div>
</div>
