###############
# justice_data
#
# The data to match against in the map step.
#
###############

package justice_data;
require Exporter;
use strict;

our @ISA = qw(Exporter);
our @EXPORT = qw(get_justices get_years); 


my @justices = ("James Wilson",
"John Jay",
"William Cushing",
"John Blair",
"John Rutledge",
"James Iredell",
"Thomas Johnson",
"William Paterson",
"Samuel Chase",
"Oliver Ellsworth",
"Bushrod Washington",
"Alfred Moore",
"John Marshall",
"William Johnson",
"Henry Brockholst Livingston",
"Thomas Todd",
"Gabriel Duvall",
"Joseph Story",
"Smith Thompson",
"Robert Trimble",
"John McLean",
"Henry Baldwin",
"James Moore Wayne",
"Roger B. Taney",
"Philip Pendleton Barbour",
"John Catron",
"John McKinley",
"Peter Vivian Daniel",
"Samuel Nelson",
"Levi Woodbury",
"Robert Cooper Grier",
"Benjamin Robbins Curtis",
"John Archibald Campbell",
"Nathan Clifford",
"Noah Haynes Swayne",
"Samuel Freeman Miller",
"David Davis",
"Stephen Johnson Field",
"Salmon P. Chase",
"William Strong",
"Joseph P. Bradley",
"Ward Hunt",
"Morrison Waite",
"John Marshall Harlan",
"William Burnham Woods",
"Stanley Matthews",
"Horace Gray",
"Samuel Blatchford",
"Lucius Quintus Cincinnatus Lamar",
"Melville Fuller",
"David Josiah Brewer",
"Henry Billings Brown",
"George Shiras",
"Howell Edmunds Jackson",
"Edward Douglass White",
"Rufus Wheeler Peckham",
"Joseph McKenna",
"Oliver Wendell Holmes",
"William R. Day",
"William Henry Moody",
"Horace Harmon Lurton",
"Charles Evans Hughes",
"Willis Van Devanter",
"Joseph Rucker Lamar",
"Mahlon Pitney",
"James Clark McReynolds",
"Louis Brandeis",
"John Hessin Clarke",
"William Howard Taft",
"George Sutherland",
"Pierce Butler",
"Edward Terry Sanford",
"Harlan F. Stone",
"Charles Evans Hughes",
"Owen Roberts",
"Benjamin N. Cardozo",
"Hugo Black",
"Stanley Forman Reed",
"Felix Frankfurter",
"William O. Douglas",
"Frank Murphy",
"James F. Byrnes",
"Robert H. Jackson",
"Wiley Blount Rutledge",
"Harold Hitz Burton",
"Fred M. Vinson",
"Tom C. Clark",
"Sherman Minton",
"Earl Warren",
"John Marshall Harlan ",
"William J. Brennan",
"Charles Evans Whittaker",
"Potter Stewart",
"Byron White",
"Arthur Goldberg",
"Abe Fortas",
"Thurgood Marshall",
"Warren E. Burger",
"Harry Blackmun",
"Lewis F. Powell",
"William Rehnquist",
"John Paul Stevens",
"Sandra Day O'Connor",
"Antonin Scalia",
"Anthony Kennedy",
"David Souter",
"Clarence Thomas",
"Ruth Bader Ginsburg",
"Stephen Breyer",
"John G. Roberts",
"Samuel Alito",
"Sonia Sotomayor",
"Elena Kagan");

my @years = qw(1789
1789
1789
1789
1789
1790
1792
1793
1796
1796
1798
1800
1801
1804
1807
1807
1811
1812
1823
1826
1830
1830
1835
1836
1836
1837
1837
1842
1845
1845
1846
1851
1853
1858
1862
1862
1862
1863
1864
1870
1870
1873
1874
1877
1881
1881
1882
1882
1888
1888
1890
1891
1892
1893
1894
1896
1898
1902
1903
1906
1910
1910
1911
1911
1912
1914
1916
1916
1921
1922
1923
1923
1925
1930
1930
1932
1937
1938
1939
1939
1940
1941
1941
1943
1945
1946
1949
1949
1953
1955
1956
1957
1958
1962
1962
1965
1967
1969
1970
1972
1924
1975
1981
1986
1988
1990
1991
1993
1994
2005
2006
2009
2010);

sub get_justices {
 return  @justices;
 }

sub get_years {
 return  @years;
 }

1;