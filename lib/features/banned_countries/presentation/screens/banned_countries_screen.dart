import 'package:auto_route/auto_route.dart';
import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentinal/app/constants/spacing.dart';
import 'package:sentinal/app/widgets/sentinal_loader.dart';
import 'package:sentinal/features/banned_countries/presentation/bloc/banned_countries_bloc.dart';
import 'package:sentinal/gen/assets.gen.dart';

@RoutePage()
class BannedCountries extends StatefulWidget {
  const BannedCountries({super.key});

  @override
  _BannedCountriesState createState() => _BannedCountriesState();
}

class _BannedCountriesState extends State<BannedCountries> {
  List<String> bannedCountries = [];

  void _addCountry(String country) {
    if (!bannedCountries.contains(country)) {
      setState(() {
        bannedCountries.add(country);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$country is already banned.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banned Countries'),
        leading: Assets.images.logo.sentinal.svg(width: 50, height: 40),
      ),
      body: Padding(
        padding: Spacing.extraLarge.paddingHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CSCPickerPlus(
              onCountryChanged: _addCountry,
              showCities: false,
              showStates: false,
            ),
            ElevatedButton(
              onPressed: bannedCountries.isEmpty
                  ? null
                  : () {
                      context.read<BannedCountriesBloc>().add(
                            AddCountry(
                              country: bannedCountries,
                            ),
                          );

                      setState(() {
                        bannedCountries = [];
                      });
                    },
              child: const Text('Submit Banned Countries'),
            ),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: bannedCountries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(bannedCountries[index]),
                    );
                  },
                ),
              ),
            ),
            const Divider(),
            Spacing.large.vertical,
            Text(
              'Your current banned countries:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const _CurrentBannedCountries(),
            Spacing.extraLarge.vertical,
          ],
        ),
      ),
    );
  }
}

class _CurrentBannedCountries extends StatelessWidget {
  const _CurrentBannedCountries();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannedCountriesBloc, BannedCountriesState>(
      bloc: context.read<BannedCountriesBloc>()..add(const LoadBannedCountries()),
      builder: (context, state) {
        return switch (state) {
          BannedCountriesInitial _ => const Center(
              child: SentinalLoader(),
            ),
          BannedCountriesLoading _ => const Center(
              child: SentinalLoader(),
            ),
          BannedCountriesError _ => const Center(
              child: Text('An error occurred'),
            ),
          CountryAdded _ => const Center(
              child: SentinalLoader(),
            ),
          CountryRemoved _ => const Center(
              child: SentinalLoader(),
            ),
          BannedCountriesLoaded _ => state.bannedCountries.isEmpty
              ? const Center(
                  child: Text('No banned countries'),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.bannedCountries.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.bannedCountries[index]),
                      );
                    },
                  ),
                ),
        };
      },
    );
  }
}
