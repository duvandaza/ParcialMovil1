
class NotaModel {
    NotaModel({
        this.id,
        this.materia,
        this.corte1,
        this.corte2,
        this.corte3,
        this.definitiva,
    });

    int id;
    String materia;
    String corte1;
    String corte2;
    String corte3;
    String definitiva;

    factory NotaModel.fromJson(Map<String, dynamic> json) => NotaModel(
        id: json["id"],
        materia: json["materia"],
        corte1: json["corte1"],
        corte2: json["corte2"],
        corte3: json["corte3"],
        definitiva: json["definitiva"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "materia": materia,
        "corte1": corte1,
        "corte2": corte2,
        "corte3": corte3,
        "definitiva": definitiva,
    };
}
