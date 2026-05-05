import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('L10n', () {
    test('appName and appVersion', () {
      expect(L10n.appName, 'Blogify');
      expect(L10n.appVersion, 'v1.2');
    });

    test('article read time labels', () {
      expect(L10n.articleReadTimeLabel, 'Read time:');
      expect(L10n.articleReadTimeUnits, 'min');
    });

    test('comment section labels', () {
      expect(L10n.commentInputHint, 'What are your thoughts?');
      expect(L10n.commentsRespondButtonTitle, 'Respond');
      expect(L10n.emptyCommentSectionPlaceholder, 'No comments yet.');
    });

    test('search filter labels', () {
      expect(L10n.searchFilterAuthor, 'by Author');
      expect(L10n.searchFilterTitle, 'by Title');
    });

    test('post placeholders and categories', () {
      expect(L10n.noPostsPlaceholder, 'No posts available at the moment.');
      expect(L10n.postsCategoryTrending, 'Trending');
      expect(L10n.postsCategoryDesign, 'Design');
      expect(L10n.postsCategoryTech, 'Tech');
    });

    test('search bar hint', () {
      expect(L10n.searchBarHint, 'Search posts...');
    });

    test('welcome screen labels', () {
      expect(L10n.welcomeScreenLabel, 'Hey, ');
      expect(L10n.welcomeScreenSubtitle, 'I have some news for you.');
    });

    test('settings and account section labels', () {
      expect(L10n.appSettingsTitle, 'Settings');
      expect(L10n.accountSectionYourActivity, 'Your activity');
      expect(L10n.accountItemPublishedArticlesTitle, 'Published articles');
      expect(L10n.accountItemLikedArticlesTitle, 'Liked articles');
      expect(L10n.accountSectionGeneral, 'General');
      expect(L10n.accountItemPersonalDataTitle, 'Personal data');
      expect(L10n.accountPushNotificationsTitle, 'Push notifications');
      expect(L10n.accountItemGeneralSettingsTitle, 'Settings');
    });

    test('placeholder page labels', () {
      expect(L10n.placeholderPageTitle, 'Coming soon');
      expect(L10n.placeholderPageSubtitle, 'This feature is still under development.');
    });

    test('published articles page empty list labels', () {
      expect(L10n.publishedArticlesPageEmptyListTitle, 'No published articles.');
      expect(
        L10n.publishedArticlesPageEmptyListSubtitle,
        'You can add an article in the home page.',
      );
    });

    test('liked articles page empty list labels', () {
      expect(L10n.likedArticlesPageEmptyListTitle, 'No liked articles yet.');
      expect(
        L10n.likedArticlesPageEmptyListSubtitle,
        'Add any article to liked in the article page.',
      );
    });
  });
}
