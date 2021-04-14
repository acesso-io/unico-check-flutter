class ErrorBioResponse {
  int? code;
  String? method;
  String? description;

  ErrorBioResponse(Map<dynamic, dynamic> map) {
    // TODO: Como tratar essa description? Ela vem de duas fontes diferentes
    for (String nome in map.keys) {
      if (nome == 'code') {
        code = map[nome];
      } else if (nome == 'method') {
        method = map[nome];
      } else if (nome == 'description') {
        description = map[nome];
      } else if (nome == 'result') {
        description = map[nome];
      }
    }
  }
}
