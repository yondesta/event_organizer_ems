<br>
<div class="row">
    <div class="col-lg-12">
        <div class="jumbotron text-center">
            <h1><small id="time-to-live"></small></h1>
        </div>
    </div>
</div>
<script>
    var refreshTimeToLive = function() {
        $.ajax({
            url: "${createLink(controller: 'event', action: 'getTimeToLive')}",
            type: "post",
            dataType: 'json',
            data: {
                eventId: "${eventInstance.id}"
            }
        }).success(function(data) {
            $('#time-to-live').text(data.time);
        }).error(function() {
            // Do nothing
        });
    };
    refreshTimeToLive();
    setInterval(function(){
        refreshTimeToLive();
    }, 5000);
</script>