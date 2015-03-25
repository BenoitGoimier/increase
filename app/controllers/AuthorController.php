<?php

class AuthorController extends ControllerBase
{

    public function projectsAction($userId)
    {
        $user = User::findFirst($userId);
        $dayOff = [];
        $percent = [];
        $class = [];

        $projets = Projet::find(array(
            "idClient = $userId"
        ));

        foreach($projets as $projet)
        {
            $dayOff[$projet->getId()] = $this->getDayOff($projet);
            $percent[$projet->getId()] = $this->getPercent($projet);
            $class[$projet->getId()] = $this->getClass($projet, $percent[$projet->getId()], $dayOff[$projet->getId()]);
        }

        $this->view->setVars(array(
            "projets" => $projets,
            "nom" => $user,
            "dayOff" => $dayOff,
            "percent" => $percent,
            "class" => $class
        ));
    }

    protected function getDayOff($projet)
    {
        $date1 = new DateTime(date("Y-m-d"));
        $date2 = new DateTime($projet->getDateFinPrevue());
        $diff = $date1->diff($date2);

        if ($diff->format("%R") == "+"){
            return $diff->format("%a");
        } else {
            return 0;
        }
    }

    protected function getPercent($projet) {
        $percent = 0;
        $total = 0;

        foreach($projet->getUsecases() as $usecase)
        {
            $total += $usecase->getPoids();
            $percent += $usecase->getPoids() * $usecase->getAvancement();
        }

        $percent /= $total;

        return round($percent,1);
    }

    protected function getClass($projet, $percent, $dayOff) {
        $date1 = new DateTime($projet->getDateLancement());
        $date2 = new DateTime($projet->getDateFinPrevue());
        $diff = $date1->diff($date2);

        $time = $diff->format("%a");
        $timePercent = ($time - $dayOff) / $time * 100;

        if($dayOff == 0){
            return "danger";
        } else if ($percent < $timePercent) {
            return "warning";
        } else {
            return "success";
        }

    }

}