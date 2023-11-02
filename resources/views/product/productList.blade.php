@include('product.header')
<body>
    <div class="container">
        <div class="container-grid">
            <div class="site-bar">
                <div class="site-bar-header">
                    <div class="wrapper-logo">
                        <img src="/images/Лого.svg" alt="logo">
                    </div>
                    <span class="title-bar">
                        <span>
                            Enterprise Resource Planning
                        </span>
                    </span>
                </div>
                <h6>Продукты</h6>
            </div>
            <div class="wrapper-list">
                <div class="header-list">
                    <span class="prod-name">ПРОДУКТЫ</span>
                    <span class="user-name">{{ (Auth::user()) ? Auth::user()->name : " Пользователь" }}</span>
                </div>
                <div class="product-list">
                    <div class="table-container">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>АРТИКУЛ</th>
                                    <th>НАЗВАНИЕ</th>
                                    <th>СТАТУС</th>
                                    <th>АТРИБУТЫ</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($products as $product)
                                    <tr class="product_change" id="{{ $product['id'] }}">
                                        <td>{{ $product['article'] }}</td>
                                        <td>{{ $product['name'] }}</td>
                                        <td>{{ ($product['status'] == 'available') ? 'Доступен' : 'Не доступен' }}</td>
                                        <td>
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
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="btn-container">
                        <button type="button" class="product-btn" id="add_new_prod" style="border: none">Добавить</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @vite(['resources/js/app.js'])
</body>
</html>