enum Flavor { development, testing, production }

class Config {
  Config(this.appName, this.flavor);

  final String appName;
  final Flavor flavor;

  factory Config.create({
    String appName = '',
    Flavor flavor = Flavor.development}) =>
      shared = Config(
        appName,
        flavor,
      );

  static Config shared = Config.create();
}