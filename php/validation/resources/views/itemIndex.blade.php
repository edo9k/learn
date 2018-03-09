<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Laravel form with Validation</title>
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
  </head>

  <body>
    <div class="container">
      <ul>
        @forelse($items as $item)
          <li><strong>{{ $item->name }}</strong> / &#36;{{ $item->price }}</li>
        @empty
          <li>There are no items stored.</li>
        @endforelse
      </ul>
    </div>
  </body>
</html> 
