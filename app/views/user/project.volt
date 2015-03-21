<h3>{{ projet.getNom() }} [user.identite] </h3>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Détails du projet</h3>
    </div>
    <div class="panel-body">
        {{ projet.getDescription() }}
    </div>
    <div class="panel-footer">
        Date de lancement : {{ projet.getDateLancement() }}<br/>
        Date de fin prévue : {{ projet.getDateFinPrevue() }}
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Equipe</h3>
    </div>
    <div class="panel-body">
        {% for dev in devs %}
            {{ dev.getIdentite() }} [ {{ poids[dev.getId()] }} % ]<br/>
        {% endfor %}
    </div>
</div>

<button id="btnMessages" class="btn btn-primary">Messages...</button><br/><br/>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Messages</h3>
    </div>
    <div class="panel-body">
        {% for message in projet.messages %}
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading{{ message.getId() }}">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ message.getId() }}" aria-expanded="false" aria-controls="collapseTwo">
                                <h4>{{ message.getObjet() }}</h4>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse{{ message.getId() }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading{{ message.getId() }}">
                        <div class="panel-body">
                            <p>{{ message.getContent() }}</p>
                            <em>{{ message.getDate() }}</em><br/>
                            <button id="btnMessages" class="btn btn-default">Répondre</button>
                        </div>
                    </div>
                </div>
            </div>
        {% endfor %}
    </div>
</div>

<button id="btnMessages" class="btn btn-default">Fermer le projet</button>