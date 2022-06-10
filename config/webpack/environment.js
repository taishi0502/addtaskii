const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)

$(function(){
    $('.flash').fadeOut(4000);  //４秒かけて消えていく
  });




module.exports = environment
