<div class="container-product">
    <div class="container-form">
        <h2 class="article_show">{{$product->name}}</h2>
        <div class="product_wrap">
            <dl class="product_info">
                <div class="key_value">
                    <dt>Артикул</dt>
                    <dd>{{$product->article}}</dd>
                </div>
                <div class="key_value">
                    <dt>Название</dt>
                    <dd>{{$product->name}}</dd>
                </div>
                <div class="key_value">
                    <dt>Статус</dt>
                    <dd>{{$product->status}}</dd>
                </div>
                <div class="key_value">
                    <dt>Атрибуты</dt>
                    <dd>
                        @php
                            if (isset($product['data'])) {
                                $data = json_decode($product['data'], true);
                                foreach ($data as $key => $value) {
                                    echo $value['name'] . ": " .$value['value'] . "<br>";
                                }
                            } else {
                                echo "null";
                            }
                        @endphp 
                    </dd>
                </div>
            </dl>
        </div>
    </div>
    <div class="close-btn">
        <div class="btn">
            <img src="/images/edit_prod.svg" alt="edit_button" width="22px" id="{{$product->id}}" class="edit_btn">
            <img src="/images/delete_prod.svg" alt="delete_button" width="22px" id="{{$product->id}}" class="delete_btn">
        </div>
        <a href="{{route('products.index')}}">
            <img src="/images/Close_round.svg" alt="close_button" width="30px">
        </a>
    </div>
</div>