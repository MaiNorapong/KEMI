:- begin_tests(icompositional).
:- use_module(icompositional, [binary_compound_cn/2, binary_compound_name_atoms/2, monoatomic_cation_cn/2,homonuclear_name_atom/2,homonuclear_cn/2,homopolyatomic_cation_cn/2]).

test(homonuclear_cn) :-
    %test + -
    homonuclear_name_atom("mononitrogen",C0),
    assertion(C0 == nitrogen-1),

    homonuclear_cn("N",C1),
    assertion(C1 == "mononitrogen"),
    homonuclear_cn("Ar",C2),
    assertion(C2 == "argon"),
  
    %test - +
    homonuclear_cn(D1, tetraphosphorus),
    assertion(D1 == "P4"),
    homonuclear_cn(D2, hexasulfur),
    assertion(D2 == "S6"),
 
    %test + +
    assertion(homonuclear_name_atom("monohydrogen", hydrogen-1)),
    assertion(homonuclear_name_atom("dioxygen", oxygen-2)),
 
    assertion(homonuclear_cn("C60", hexacontacarbon)),
    assertion(homonuclear_cn("S8", octasulfur)),
  
    true.
 
test(binary_compound_cn) :-
    %test + -
    binary_compound_name_atoms("hydrogen chloride",A0),
    assertion(A0 == [hydrogen-1, chlorine-1]),
    binary_compound_name_atoms("nitrogen monooxide",A1),
    binary_compound_name_atoms("nitrogen monoxide",A1),
    assertion(A1 == [nitrogen-1, oxygen-1]),
    binary_compound_name_atoms("nitrogen dioxide",A2),
    assertion(A2 == [nitrogen-1, oxygen-2]),
    binary_compound_name_atoms("dioxygen chloride",A3),
    assertion(A3 == [oxygen-2, chlorine-1]),
    binary_compound_name_atoms("triiron tetraoxide",A4),
    assertion(A4 == [iron-3, oxygen-4]),
    binary_compound_name_atoms("silicon tetrachloride",A5),
    assertion(A5 == [silicon-1, chlorine-4]),
    binary_compound_name_atoms("nickel stannide",A6),
    assertion(A6 == [nickel-1, tin-1]),
    binary_compound_name_atoms("tricosachromium hexacarbide",A7),
    assertion(A7 == [chromium-23, carbon-6]),
  
    %test - +
    binary_compound_name_atoms(B0, [hydrogen-1, chlorine-1]),
    assertion(B0 == "hydrogen chloride"),
    binary_compound_name_atoms(B1, [nitrogen-1, oxygen-1]),
    assertion(B1 == "nitrogen monoxide"),
    binary_compound_name_atoms(B2, [nitrogen-1, oxygen-2]),
    assertion(B2 == "nitrogen dioxide"),
    binary_compound_name_atoms(B3, [oxygen-2, chlorine-1]),
    assertion(B3 == "dioxygen chloride"),
    binary_compound_name_atoms(B4, [iron-3, oxygen-4]),
    assertion(B4 == "triiron tetraoxide"),
    binary_compound_name_atoms(B5, [silicon-1, chlorine-4]),
    assertion(B5 == "silicon tetrachloride"),
    binary_compound_name_atoms(B6, [nickel-1, tin-1]),
    assertion(B6 == "nickel stannide"),
    binary_compound_name_atoms(B7, [chromium-23, carbon-6]),
    assertion(B7 == "tricosachromium hexacarbide"),
 
    %test + +
    assertion(binary_compound_name_atoms("hydrogen chloride", [hydrogen-1, chlorine-1])),
    assertion(binary_compound_name_atoms("nitrogen monoxide", [nitrogen-1, oxygen-1])),
    assertion(binary_compound_name_atoms("dioxygen chloride", [oxygen-2, chlorine-1])),
    assertion(binary_compound_name_atoms("triiron tetraoxide", [iron-3, oxygen-4])),
    assertion(binary_compound_name_atoms("silicon tetrachloride", [silicon-1, chlorine-4])),
    assertion(binary_compound_name_atoms("nickel stannide", [nickel-1, tin-1])),
    assertion(binary_compound_name_atoms("tricosachromium hexacarbide", [chromium-23, carbon-6])),

    assertion(binary_compound_cn("NaCl", "sodium chloride")),
    % Red book IR-5.2 tests
    assertion(binary_compound_cn("HCl", "hydrogen chloride")),
    assertion(binary_compound_cn("NO", "nitrogen monoxide")),
    assertion(binary_compound_cn("NO2", "nitrogen dioxide")),
    assertion(binary_compound_cn("N2O4", "dinitrogen tetraoxide")),
    assertion(binary_compound_cn("OCl2", "oxygen dichloride")),
    assertion(binary_compound_cn("O2Cl", "dioxygen chloride")),
    assertion(binary_compound_cn("Fe3O4", "triiron tetraoxide")),
    assertion(binary_compound_cn("SiC", "silicon carbide")),
    assertion(binary_compound_cn("SiCl4", "silicon tetrachloride")),
    assertion(binary_compound_cn("Ca3P2", "tricalcium diphosphide")),
    assertion(binary_compound_cn("NiSn", "nickel stannide")),
    assertion(binary_compound_cn("Cu5Zn8", "pentacopper octazincide")),
    assertion(binary_compound_cn("Cr23C6", "tricosachromium hexacarbide")),
    
    true.

test(monoatomic_cation_cn) :-
    % test + -
    monoatomic_cation_cn("Na+", N0),
    assertion(N0 == "sodium(1+)"),
    monoatomic_cation_cn("(Cr)3+", N1),
    assertion(N1 == "chromium(3+)"),
    monoatomic_cation_cn("(I)+", N2),
    assertion(N2 == "iodine(1+)"),
    
    % test - +
    monoatomic_cation_cn(F0, "sodium(1+)"),
    assertion(F0 == "(Na)+"),
    monoatomic_cation_cn(F1, "chromium(3+)"),
    assertion(F1 == "(Cr)3+"),
    monoatomic_cation_cn(F2, "iodine(1+)"),
    assertion(F2 == "(I)+"),

    % test + +
    assertion(monoatomic_cation_cn("Na+", "sodium(1+)")),
    assertion(monoatomic_cation_cn("(Cr)3+", "chromium(3+)")),
    assertion(monoatomic_cation_cn("(I)+", "iodine(1+)")),
    
    true.

test(homopolyatomic_cation_cn) :-
    % test + -
    homopolyatomic_cation_cn("(S4)2+", N0),
    assertion(N0 == "tetrasulfur(2+)"),
    homopolyatomic_cation_cn("(O2)+", N1),
    assertion(N1 == "dioxygen(1+)"),
    homopolyatomic_cation_cn("(Bi5)4+", N2),
    assertion(N2 == "pentabismuth(4+)"),

    % test - +
    homopolyatomic_cation_cn(F0, "tetrasulfur(2+)"),
    assertion(F0 == "(S4)2+"),
    homopolyatomic_cation_cn(F1, "dioxygen(1+)"),
    assertion(F1 == "(O2)+"),
    homopolyatomic_cation_cn(F2, "pentabismuth(4+)"),
    assertion(F2 == "(Bi5)4+"),
    
    % test + +
    assertion(homopolyatomic_cation_cn("(S4)2+", "tetrasulfur(2+)")),
    assertion(homopolyatomic_cation_cn("(O2)+", "dioxygen(1+)")),
    assertion(homopolyatomic_cation_cn("(Bi5)4+", "pentabismuth(4+)")),
    
    true.
 
:- end_tests(icompositional).
