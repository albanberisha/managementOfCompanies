<?php
class Calendar {

    private $active_year, $active_month, $active_day;
    private $events = [];

    public function __construct($date) {
        $this->active_year = $date != null ? date('Y', strtotime($date)) : date('Y');
        $this->active_month = $date != null ? date('m', strtotime($date)) : date('m');
        $this->active_day = $date != null ? date('d', strtotime($date)) : date('d');
    }

    public function add_event($id,$txt,$time, $date, $days = 1, $color = '') {
        $color = $color ? ' ' . $color : $color;
        $this->events[] = [$id,$txt,$time, $date, $days, $color];
    }

    public function __toString() {
        $num_days = date('t', strtotime($this->active_day . '-' . $this->active_month . '-' . $this->active_year));
        $num_days_last_month = date('j', strtotime('last day of previous month', strtotime($this->active_day . '-' . $this->active_month . '-' . $this->active_year)));
        $days = [0 => 'Sun', 1 => 'Mon', 2 => 'Tue', 3 => 'Wed', 4 => 'Thu', 5 => 'Fri', 6 => 'Sat'];
        $first_day_of_week = array_search(date('D', strtotime($this->active_year . '-' . $this->active_month . '-1')), $days);
        $html = '<div class="calendar">';
        $html .= '<div class="header">';
        $html .= '<div class="month-year">';
        $html .= '<button class="month-yearbt btttt3" onclick="backDay('.$this->active_day.','.$this->active_month.','.$this->active_year.');"><i class="fa fa-long-arrow-left m-l-7" aria-hidden="true"></i></button>';
        $html .= date('F Y', strtotime($this->active_year . '-' . $this->active_month . '-' . $this->active_day));
        $html .= '<button class="month-yearbt btttt4" onclick="forwardDay('.$this->active_day.','.$this->active_month.','.$this->active_year.');"><i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i></button>';
        $html .= '</div>';
        $html .= '</div>';
        $html .= '<div class="days">';
        foreach ($days as $day) {
            $html .= '
                <div class="day_name">
                    ' . $day . '
                </div>
            ';
        }
        for ($i = $first_day_of_week; $i > 0; $i--) {
            $html .= '
                <div class="day_num ignore">
                    ' . ($num_days_last_month-$i+1) . '
                </div>
            ';
        }
        for ($i = 1; $i <= $num_days; $i++) {
            $selected = '';
            if ($i == $this->active_day) {
                $selected = ' selected';
            }
            $html .= '<div class="day_num' . $selected . '">';
            $html .= '<span>' . $i . '</span>';
            foreach ($this->events as $event) {
                for ($d = 0; $d <= ($event[4]-1); $d++) {
                    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
                    if ($date->format('y-m-d', strtotime($this->active_year . '-' . $this->active_month . '-' . $i . ' -' . $d . ' day')) == date('y-m-d', strtotime($event[3]))) {
                        $html .= '<div class="event' . $event[5] . '" id='. $event[0] .' onclick="showPopup('.$event[0].');">';
                        $html .= '<div class="time">';
                        $html .= $event[2];
                        $html .= '</div>';
                        $html .= '<div class="eventShortDesc">';
                        $html .= $event[1];
                        $html .= '</div>';
                        $html .= '</div>';
                    }
                }
            }
            $html .= '<div class="event addEvent" onclick="showAddEvent('.$i.','.$this->active_month.','. $this->active_year.');">';
            $html.= "Shto";
            $html .= '</div>';
            $html .= '</div>';
        }
        for ($i = 1; $i <= (42-$num_days-max($first_day_of_week, 0)); $i++) {
            $html .= '
                <div class="day_num ignore">
                    ' . $i . '
                </div>
            ';
        }
        $html .= '</div>';
        $html .= '</div>';
        return $html;
    }

}
?>
