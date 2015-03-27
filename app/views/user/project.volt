{% if projet != "" %}
    <h3>{{ projet.getNom() }} by {{ nom.getIdentite() }} </h3>
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

    {% if projet.messages|length != 0 %}
        <button id="btnMessages" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" >Messages...</button><br/><br/>

        <div class="collapse" id="collapseExample">
            <div class="well" style="background-color: #ffffff; border: none; box-shadow: none; padding: inherit;">
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
            </div>
        </div>
    {% else %}
        <button class="btn btn-primary">Aucun message</button><br/><br/>
    {% endif %}


    <a href="/increase/user/projects/{{ nom.getId() }}" id="btnMessages" class="btn btn-default">Fermer le projet</a>
{% else %}
    <h3>Aucun projet n'a cet identifiant!</h3>
    <a href="/increase/" id="btnMessages" class="btn btn-default">Retour</a>
{% endif %}