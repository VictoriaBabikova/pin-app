<div class="container-product">
    <div class="container-form">
        <h2>Редактировать продукт</h2>
        <form action="" class="product-form" method="post" id="formId">
            <label for ="article">Артикул</label> 
            @if (Auth::user())
                @if(Auth::user()->isAdmin() === 'true')
                    <input type="text" name="article" required value="{{$product['article']}}" class="input">
                @else
                    <input type="text" readonly="readonly" name="article" required value="{{$product['article']}}" class="input">
                    <span style="color:#abaaaa;padding:2px 0;">это поле может изменять только администратор</span>
                @endif
            @endif
            <div class="error" id="error_article"></div>
            <label for ="name">Название</label> 
            <input type="text" name="name" required value="{{$product['name']}}" class="input">
            <div class="error" id="error_name"></div>
            <label for ="status">Статус</label>
            <select class="form-select" name="status" id="status">
                <option value="{{$product['status']}}" selected>Доступен</option>
                <option value="available">Доступен</option>
                <option value="unavailable">Не доступен</option>
            </select>
            <h4>Атрибуты</h4>
            <div id="vendor-body">
                <button type="button" class="btn-add-vendor" id="vendor">+ Добавить атрибут</button>
                <div id="vendor-cont">
                    @php
                        if (isset($product['data'])) {
                            $data = json_decode($product['data'], true);
                            foreach ($data as $key => $value) {
                                echo "<div class='vendor-group'>
                                        <div class='vendor-group-item'>
                                            <label for='vendor-color'>Название</label> 
                                                <input type='text' name='vendor-name' value=" . $value["name"] .">  
                                            </div>
                                            <div class='vendor-group-item pd'>
                                                <label for ='vendor-size'>Значение</label> 
                                                <input type='text' name='vendor-value' value=" . $value["value"] .">
                                            </div>
                                            <div class='btn-delete'>
                                                <img src='/images/delete-btn.svg' alt='delete_button' id ='delete-btn' class='delete-btn' width='20px'>
                                            </div>
                                    </div>";
                            }
                        }
                    @endphp 
                </div>
            </div>
            <input type="submit" value="Сохранить" class="product-btn" style="border: none" id="store_new_prod">
        </form> 
    </div>
    <div class="close-btn">
        <a href="{{route('products.index')}}">
            <img src="/images/Close_round.svg" alt="close_button" width="30px">
        </a>
    </div>
</div>