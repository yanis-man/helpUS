document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {

        locale:"fr",
        height:550,
        initialView: 'timeGridWeek',
        initialDate: '2021-02-07',

        slotMinTime:"08:15:00",
        slotMaxTime:"17:35:00",

        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },

        events:[]
    });

calendar.addEvent({
    title:"okok",
    start: "2021-02-12T10:30:00",
    backgroundColor:"#aaaaaa"
});
calendar.addEvent({
    title:"az",
    start: "2021-02-17T10:30:00",
    backgroundColor:"#aaaaaa"
})
calendar.render();
  });
