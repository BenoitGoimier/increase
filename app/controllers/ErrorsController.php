<?php

class ErrorsController extends ControllerBase
{
    public function initialize()
    {
        $url = $this->dispatcher->getPreviousControllerName()."/".$this->dispatcher->getPreviousActionName();
        $this->flash->error("la page suivante {$url} n'est pas accessible!");
        $this->tag->setTitle('Oops!');
        parent::initialize();
    }

    public function show404Action()
    {

    }

    public function show401Action()
    {

    }

    public function show500Action()
    {

    }
}
