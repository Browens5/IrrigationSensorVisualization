// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chartdata.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sensorHash() => r'd4f3f7bf79321a8d84d2e925396dd00a9abfa7a8';

/// See also [sensor].
@ProviderFor(sensor)
final sensorProvider = Provider<SensorManager>.internal(
  sensor,
  name: r'sensorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sensorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SensorRef = ProviderRef<SensorManager>;
String _$filteredDataHash() => r'4fdf820b76209cc52653edb406864e761c4690e0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [filteredData].
@ProviderFor(filteredData)
const filteredDataProvider = FilteredDataFamily();

/// See also [filteredData].
class FilteredDataFamily extends Family<List<ChartData>> {
  /// See also [filteredData].
  const FilteredDataFamily();

  /// See also [filteredData].
  FilteredDataProvider call(
    SourceKind kind, {
    int nPoints = 200,
  }) {
    return FilteredDataProvider(
      kind,
      nPoints: nPoints,
    );
  }

  @override
  FilteredDataProvider getProviderOverride(
    covariant FilteredDataProvider provider,
  ) {
    return call(
      provider.kind,
      nPoints: provider.nPoints,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredDataProvider';
}

/// See also [filteredData].
class FilteredDataProvider extends AutoDisposeProvider<List<ChartData>> {
  /// See also [filteredData].
  FilteredDataProvider(
    SourceKind kind, {
    int nPoints = 200,
  }) : this._internal(
          (ref) => filteredData(
            ref as FilteredDataRef,
            kind,
            nPoints: nPoints,
          ),
          from: filteredDataProvider,
          name: r'filteredDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredDataHash,
          dependencies: FilteredDataFamily._dependencies,
          allTransitiveDependencies:
              FilteredDataFamily._allTransitiveDependencies,
          kind: kind,
          nPoints: nPoints,
        );

  FilteredDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.kind,
    required this.nPoints,
  }) : super.internal();

  final SourceKind kind;
  final int nPoints;

  @override
  Override overrideWith(
    List<ChartData> Function(FilteredDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredDataProvider._internal(
        (ref) => create(ref as FilteredDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        kind: kind,
        nPoints: nPoints,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<ChartData>> createElement() {
    return _FilteredDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredDataProvider &&
        other.kind == kind &&
        other.nPoints == nPoints;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, kind.hashCode);
    hash = _SystemHash.combine(hash, nPoints.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredDataRef on AutoDisposeProviderRef<List<ChartData>> {
  /// The parameter `kind` of this provider.
  SourceKind get kind;

  /// The parameter `nPoints` of this provider.
  int get nPoints;
}

class _FilteredDataProviderElement
    extends AutoDisposeProviderElement<List<ChartData>> with FilteredDataRef {
  _FilteredDataProviderElement(super.provider);

  @override
  SourceKind get kind => (origin as FilteredDataProvider).kind;
  @override
  int get nPoints => (origin as FilteredDataProvider).nPoints;
}

String _$sensorDataNotifierHash() =>
    r'6b6f2db65e715214df8638b28bef2f8d5197d291';

abstract class _$SensorDataNotifier extends BuildlessNotifier<List<ChartData>> {
  late final SourceKind kind;

  List<ChartData> build(
    SourceKind kind,
  );
}

/// See also [SensorDataNotifier].
@ProviderFor(SensorDataNotifier)
const sensorDataNotifierProvider = SensorDataNotifierFamily();

/// See also [SensorDataNotifier].
class SensorDataNotifierFamily extends Family<List<ChartData>> {
  /// See also [SensorDataNotifier].
  const SensorDataNotifierFamily();

  /// See also [SensorDataNotifier].
  SensorDataNotifierProvider call(
    SourceKind kind,
  ) {
    return SensorDataNotifierProvider(
      kind,
    );
  }

  @override
  SensorDataNotifierProvider getProviderOverride(
    covariant SensorDataNotifierProvider provider,
  ) {
    return call(
      provider.kind,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sensorDataNotifierProvider';
}

/// See also [SensorDataNotifier].
class SensorDataNotifierProvider
    extends NotifierProviderImpl<SensorDataNotifier, List<ChartData>> {
  /// See also [SensorDataNotifier].
  SensorDataNotifierProvider(
    SourceKind kind,
  ) : this._internal(
          () => SensorDataNotifier()..kind = kind,
          from: sensorDataNotifierProvider,
          name: r'sensorDataNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sensorDataNotifierHash,
          dependencies: SensorDataNotifierFamily._dependencies,
          allTransitiveDependencies:
              SensorDataNotifierFamily._allTransitiveDependencies,
          kind: kind,
        );

  SensorDataNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.kind,
  }) : super.internal();

  final SourceKind kind;

  @override
  List<ChartData> runNotifierBuild(
    covariant SensorDataNotifier notifier,
  ) {
    return notifier.build(
      kind,
    );
  }

  @override
  Override overrideWith(SensorDataNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SensorDataNotifierProvider._internal(
        () => create()..kind = kind,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        kind: kind,
      ),
    );
  }

  @override
  NotifierProviderElement<SensorDataNotifier, List<ChartData>> createElement() {
    return _SensorDataNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SensorDataNotifierProvider && other.kind == kind;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, kind.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SensorDataNotifierRef on NotifierProviderRef<List<ChartData>> {
  /// The parameter `kind` of this provider.
  SourceKind get kind;
}

class _SensorDataNotifierProviderElement
    extends NotifierProviderElement<SensorDataNotifier, List<ChartData>>
    with SensorDataNotifierRef {
  _SensorDataNotifierProviderElement(super.provider);

  @override
  SourceKind get kind => (origin as SensorDataNotifierProvider).kind;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
