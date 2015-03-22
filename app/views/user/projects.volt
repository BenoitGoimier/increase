<h3>Mes projets {{ nom.getIdentite() }}</h3>

{% for projet in projets %}
    <div class="row">
        <div class="col-md-1">
            {{ projet.getnom() }}
        </div>

        <div class="col-md-6">
            <div class="progress">
                <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                    <span class="sr-only">40% Complete (success)</span>
                </div>
            </div>
        </div>

        <div class="col-md-2">
            {{ projet.getDayOff() }} jour(s) restant(s)
        </div>

        <div class="col-md-1">
            <input class="btn btn-default" value="Ouvrir">
        </div>
    </div>
{% endfor %}